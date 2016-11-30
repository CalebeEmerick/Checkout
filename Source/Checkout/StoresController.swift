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
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    fileprivate lazy var presenter: StorePresenter = StorePresenter(storeView: self)
    fileprivate let dataSource = StoreDataSource()
    fileprivate let delegate = StoreDelegate()
}

// MARK: - Life Cycle -

extension StoresController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        
    }
}

// MARK: - Methods -

extension StoresController {
    
    
}

// MARK: - StoresView Protocol -

extension StoresController : StoresView {
    
    func setupCollectionView() {
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        presenter.setLayout(for: collectionView)
    }
}
