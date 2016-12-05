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
    
    fileprivate var presenter: StorePresenter?
}

// MARK: - Life Cycle -

extension StoresController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = StorePresenter(storeView: self)
        presenter?.setupCollectionView(for: collectionView)
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
    
    func showContainer(with stores: [Store]) {
        
//        self.container.alpha = 1
//        collectionView.reloadData()
        presenter?.updateStores(for: collectionView, with: stores)
//        activityIndicator.stopAnimating()
//        
//        UIView.animate(withDuration: 0.4) {
//            
//            self.container.alpha = 1
//        }
    }
}
