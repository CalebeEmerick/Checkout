//
//  StoresController.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

// MARK: - Variables & Outlets -

class StoresController : UIViewController {
    
    @IBOutlet fileprivate weak var container: UIView!
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate let storeError = StoreError.makeXib()
    fileprivate let dataSource = StoreDataSource()
    fileprivate let delegate = StoreDelegate()
    fileprivate let layout = StoreLayout()
    fileprivate var presenter: StorePresenter?
}

// MARK: - Life Cycle -

extension StoresController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeNavigationBarBackButton()
        presenter = StorePresenter(storeView: self)
        delegate.selectedStore = { [weak self] store in self?.openTransactionController(with: store) }
        layout.setupCollectionView(for: collectionView, dataSource: dataSource, delegate: delegate)
        setErrorViewConstraints()
        presenter?.getStores()
    }
}

// MARK: - Methods -

extension StoresController {
    
    fileprivate func setErrorViewConstraints() {
        
        DispatchQueue.main.async {
            
            self.storeError.alpha = 0
            self.storeError.triedAgain = { self.tryLoadStoresAgain() }
            self.view.addSubview(self.storeError)
            self.storeError.translatesAutoresizingMaskIntoConstraints = false
            self.storeError.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
            self.storeError.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
            self.storeError.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
            self.storeError.heightAnchor.constraint(equalToConstant: self.storeError.bounds.height).isActive = true
        }
    }
    
    fileprivate func changeStoreError(alpha: CGFloat) {
        
        UIView.animate(withDuration: 0.4) {
            
            self.storeError.alpha = alpha
        }
    }
}

// MARK: - StoresView Protocol -

extension StoresController : StoresView {
    
    func showLoading() {
        
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        
        activityIndicator.stopAnimating()
    }
    
    func showContainer() {
        
        hideLoading()
        UIView.animate(withDuration: 0.4) {
            
            self.container.alpha = 1
        }
    }
    
    func update(stores: [Store]) {
        
        DispatchQueue.main.async {
        
            self.dataSource.stores = stores
            self.collectionView.reloadData()
        }
    }
    
    func showError(message: String) {
        
        storeError.message = message
        changeStoreError(alpha: 1)
    }
    
    func hideError() {
        
        changeStoreError(alpha: 0)
    }
    
    func tryLoadStoresAgain() {
        
        hideError()
        showLoading()
        presenter?.getStores()
    }
    
    func openTransactionController(with store: Store) {
        
        TransactionRouter.openCreditCardTransactionController(from: self, with: store)
    }
}
