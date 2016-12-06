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
    
    fileprivate let layout = TransactionLayout()
    var store: Store?
}

// MARK: - Life Cycle -

extension TransactionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBorderForTextFields()
    }
}

// MARK: - Methods -

extension TransactionController {
    
    fileprivate func setBorderForTextFields() {
        
        let textFields: [UITextField] = [cardNumber, cardName, cardValidate, cardSecurityCode, transactionValue, fullName, email]
        
        
    }
}

// MARK: - TransactionView Protocol -
