//
//  TransactionTextField.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class TransactionTextField : UITextField {

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return adjustLeftInset(for: bounds)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return adjustLeftInset(for: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return adjustLeftInset(for: bounds)
    }
}

extension TransactionTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderStyle()
    }
}

extension TransactionTextField {
    
    fileprivate func borderStyle() {
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = Color(hexString: "#ddd").cgColor
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    fileprivate func adjustLeftInset(for bounds: CGRect) -> CGRect {
        
        var bounds = bounds
        bounds.origin.x = 8
        
        return bounds
    }
}
