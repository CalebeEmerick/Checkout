//
//  StoreCell.swift
//  Checkout
//
//  Created by Calebe Emerick on 30/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

class StoreCell : UICollectionViewCell {

    @IBOutlet fileprivate weak var picture: UIImageView!
    
    var store: Store?
}

extension StoreCell {
    
    func setImage(by index: Int) {
        
        let image: UIImage
        
        switch index {
            
        case 0: image = Image.Store.chilliBeans
        case 1: image = Image.Store.ipiranga
        case 2: image = Image.Store.reserva
        default: image = Image.Store.submarino
        }
        
        self.store?.image = image
        self.picture.image = image
    }
}
