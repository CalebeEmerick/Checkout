//
//  CreditCardCell.swift
//  Checkout
//
//  Created by Calebe Emerick on 07/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

class CreditCardCell : UICollectionViewCell {

    @IBOutlet fileprivate weak var creditCardImage: UIImageView!
    @IBOutlet fileprivate weak var selectedImage: UIImageView!
    
    var brand: CreditCardBrand? { didSet { updateUI() } }
    override var isSelected: Bool {
        
        get { return super.isSelected }
        
        set {
            
            if newValue { toggleState(with: true) }
            else { toggleState(with: false) }
        }
    }
}

extension CreditCardCell {
    
    fileprivate func updateUI() {
        
        guard let brand = brand else { return }
        
        creditCardImage.image = brand.image
    }
    
    fileprivate func selectBrand(_ select: Bool) {
        
        if select {
            
            toggleSelectedImage(with: 1)
        }
        else {
            
            toggleSelectedImage(with: 0)
        }
    }
    
    fileprivate func toggleState(with status: Bool) {
        
        super.isSelected = status
        selectBrand(super.isSelected)
    }
    
    private func toggleSelectedImage(with alpha: CGFloat) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.selectedImage.alpha = alpha
        }
    }
}
