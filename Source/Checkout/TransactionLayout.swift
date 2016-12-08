//
//  TransactionLayout.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct TransactionLayout {
    
    func setupCollectionView(for collectionView: UICollectionView, dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
     
        collectionView.register(cellNib: CreditCardCell.self)
        collectionView.allowsMultipleSelection = false
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
}
