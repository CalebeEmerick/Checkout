//
//  TransactionController.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

// MARK: - Variables & Outlets -

class TransactionController : UITableViewController {

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
    
    fileprivate let datePicker = DatePicker.makeXib()
    fileprivate let dataSource = TransactionDataSource()
    fileprivate let delegate = TransactionDelegate()
    fileprivate let layout = TransactionLayout()
    fileprivate var textFields: [UITextField]!
    var store: Store?
}

// MARK: - Life Cycle -

extension TransactionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate.creditCardSelected = { [weak self] brand in print(brand.name)  }
        layout.setupCollectionView(for: collectionView, dataSource: dataSource, delegate: delegate)
        textFields = [cardNumber, cardName, cardValidate, cardSecurityCode, transactionValue, fullName, email]
    }
}

// MARK: - Methods -

extension TransactionController {
    
    
}

// MARK: - UITextFieldDelegate -

extension TransactionController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == cardValidate {
            
            textField.inputView = datePicker
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
