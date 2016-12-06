//
//  StoreLayout.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct StoreLayout {
    
    func setupCollectionView(for collectionView: UICollectionView, dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {

        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(cellNib: StoreCell.self)
        setLayout(for: collectionView)
    }
    
    private func setLayout(for collectionView: UICollectionView) {

        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let width = (Constants.screenSize.width - 3) / 2
        let height = (Constants.screenSize.height - 195) / 2

        layout?.itemSize = CGSize(width: width, height: height)
    }
}
