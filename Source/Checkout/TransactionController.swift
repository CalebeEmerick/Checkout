//
//  TransactionController.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

// MARK: - Variables & Outlets -

final class TransactionController : UITableViewController {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var cardNumber: UITextField!
    @IBOutlet fileprivate weak var cardName: UITextField!
    @IBOutlet fileprivate weak var cardValidate: UITextField!
    @IBOutlet fileprivate weak var cardSecurityCode: UITextField!
    @IBOutlet fileprivate weak var transactionValue: UITextField!
    @IBOutlet fileprivate weak var fullName: UITextField!
    @IBOutlet fileprivate weak var email: UITextField!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet fileprivate weak var makeTransactionButton: UIButton!
    
    @IBAction private func makeTransaction(_ sender: UIButton) { makeTransactionRequest() }
    
    fileprivate let datePicker = DatePicker.makeXib()
    fileprivate let datePickerAccessory = DatePickerAccessory.makeXib()
    fileprivate let dataSource = TransactionDataSource()
    fileprivate let delegate = TransactionDelegate()
    fileprivate let layout = TransactionLayout()
    fileprivate var textFields: [UITextField]!
    fileprivate var presenter: TransactionPresenter?
    fileprivate var creditCardBrand: CreditCardBrand?
    var store: Store?
}

// MARK: - Life Cycle -

extension TransactionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = TransactionPresenter(transactionView: self)
        datePickerAccessory.didCancel = { self.view.endEditing(true) }
        datePickerAccessory.didSelected = { self.setValityDateFor(month: self.datePicker.delegate.selectedMonth, year: self.datePicker.delegate.selectedYear) }
        delegate.creditCardSelected = { [weak self] brand in self?.creditCardBrand = brand  }
        layout.roundButton(for: makeTransactionButton)
        layout.setupCollectionView(for: collectionView, dataSource: dataSource, delegate: delegate)
        textFields = [cardNumber, cardName, cardValidate, cardSecurityCode, transactionValue, fullName, email]
    }
}

// MARK: - Methods -

extension TransactionController {

    fileprivate func setValityDateFor(month: String, year: String) {
        
        cardValidate.text = "\(month)/\(year)"
    }
    
    fileprivate func viewStatus(isEnabled: Bool) {
        
        layout.toggleUserInterface(textFields: textFields, collectionView: collectionView)
        layout.shouldToggleButtonState(toggle: isEnabled, with: [buttonLeadingConstraint, buttonTrailingConstraint], view: self.view)
    }
    
    fileprivate func convertToCents(from string: String) -> Int64 {
        
        let amountString = string.replacingOccurrences(of: ",", with: "")
        
        guard let amount = Int64(amountString) else { return 0 }
        
        return amount
    }
    
    fileprivate func makeTransactionRequest() {
        
        guard let store = store else { return }
        guard let brand = creditCardBrand else { return }
        guard let number = cardNumber.text else { return }
        guard let name = cardName.text else { return }
        guard let securityCodeString = cardSecurityCode.text,
            let secutiryCode = Int(securityCodeString) else { return }
        guard let fullName = fullName.text else { return }
        guard let email = email.text else { return }
        guard let amountString = transactionValue.text else { return }
        let amount = convertToCents(from: amountString)
        
        let valityDate = ValityDate(month: datePicker.delegate.apiSelectedMonth, year: datePicker.delegate.apiSelectedYear)
        let creditCard = CreditCard(brand: brand, number: number, name: name, valityDate: valityDate, securityCode: secutiryCode)
        let person = Person(name: fullName, email: email)
        let transaction = Transaction(creditCard: creditCard, person: person, amount: amount)
        
        presenter?.makeTransaction(from: store.merchantKey, with: transaction)
    }
}

// MARK: - UITextFieldDelegate -

extension TransactionController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == cardValidate {
            
            textField.inputView = datePicker
            textField.inputAccessoryView = datePickerAccessory
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField != email {
            
            for index in 0 ..< textFields.count - 1 where textField == textFields[index] {
                
                textFields[index + 1].becomeFirstResponder()
                break
            }
        }
        else { textField.endEditing(true) }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
            
        case cardSecurityCode:
            return layout.limitCharacters(from: textField, with: string, range: range, maxCharacters: 3)
            
        case cardNumber:
            return layout.limitCharacters(from: textField, with: string, range: range, maxCharacters: 19)
            
        default: return true
        }
    }
}

// MARK: - UITableViewDelegate -

extension TransactionController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
            
        case 0: return 40
        case 1: return 40
        default: return 20
        }
    }
}

// MARK: - TransactionView Protocol -

extension TransactionController : TransactionView {

    func showLoading() {
        
        viewStatus(isEnabled: true)
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        
        viewStatus(isEnabled: false)
        activityIndicator.stopAnimating()
    }
    
    func showAlert(with error: String) {
        
        layout.showAlert(for: self, with: error, title: "Oops!")
    }
}
