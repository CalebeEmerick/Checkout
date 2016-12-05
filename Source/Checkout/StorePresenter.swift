//
//  StorePresenter.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct StorePresenter {
    
    private let service = StoreService()
    private let dataSource = StoreDataSource()
    private let delegate = StoreDelegate()
    private unowned var storeView: StoresView
    
    init(storeView: StoresView) {
        
        self.storeView = storeView
    }
    
    func getStores() {
        
        guard let key = LoginManager.sharedInstance.user?.customerKey else { return }

        storeView.startAnimating()
        
        DispatchQueue.main.async {
            
            self.service.getStores(from: key) { result in
                
                switch result {
                    
                case let .success(stores):
                    self.storeView.stopAnimating()
                    self.storeView.showContainer(with: stores)
                    
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    func updateStores(for collectionView: UICollectionView, with stores: [Store]) {
        
        DispatchQueue.main.async {
        
            self.dataSource.stores = stores
            collectionView.reloadData()
        }
//        collectionView.insertSections(IndexSet(1...1))
    }
    
    func setupCollectionView(for collectionView: UICollectionView) {
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(cellNib: StoreCell.self)
        setLayout(for: collectionView)
    }
    
    private func setLayout(for collectionView: UICollectionView) {
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width: CGFloat = (collectionView.bounds.width - 5) / 2
        let height: CGFloat = (collectionView.bounds.height - 5) / 2
        
        layout?.itemSize = CGSize(width: width, height: height)
    }
}
