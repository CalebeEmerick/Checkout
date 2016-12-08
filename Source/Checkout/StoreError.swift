//
//  StoreError.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class StoreError : UIView {
    
    @IBOutlet fileprivate weak var errorMessage: UILabel!
    @IBOutlet fileprivate weak var tryAgainButton: UIButton!
    @IBAction private func tryAgainAction(_ sender: UIButton) { triedAgain?() }
    
    var message: String? { didSet { updateErrorMessage() } }
    var triedAgain: (() -> Void)?
}

extension StoreError {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buttonStyle()
    }
}

extension StoreError {
    
    fileprivate func buttonStyle() {
        
        tryAgainButton.layer.borderWidth = 1
        tryAgainButton.layer.borderColor = Color(hexString: "#1085C9").cgColor
        tryAgainButton.layer.cornerRadius = 5
        tryAgainButton.clipsToBounds = true
    }
    
    func updateErrorMessage() {
        
        DispatchQueue.main.async {
            
            self.errorMessage.text = self.message
        }
    }
}
