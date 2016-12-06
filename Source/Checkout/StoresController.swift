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
    
    fileprivate let dataSource = StoreDataSource()
    fileprivate let delegate = StoreDelegate()
    fileprivate var presenter: StorePresenter?
    fileprivate var layout: StoreLayout?
}

// MARK: - Life Cycle -

extension StoresController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = StorePresenter(storeView: self)
        layout = StoreLayout()
        layout?.setupCollectionView(for: collectionView, dataSource: dataSource, delegate: delegate)
        presenter?.getStores()
    }
}

// MARK: - Methods -

extension StoresController {
    
    
}

// MARK: - StoresView Protocol -

extension StoresController : StoresView {
    
    func startAnimating() {
        
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        
        activityIndicator.stopAnimating()
    }
    
    func showContainer() {
        
        stopAnimating()
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
}
