//
//  TransactionLayout.swift
//  Checkout
//
//  Created by Calebe Emerick on 06/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

struct TransactionLayout : LayoutProtocol {
    
    func setupCollectionView(for collectionView: UICollectionView, dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate) {
     
        collectionView.register(cellNib: CreditCardCell.self)
        collectionView.allowsMultipleSelection = false
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
    
    func limitCharacters(from textField: UITextField, with string: String, range: NSRange, maxCharacters: Int) -> Bool {
        
        let characterCountLimit = maxCharacters
        
        let startingLength = textField.text?.characters.count ?? 0
        let lengthToAdd = string.characters.count
        let lengthToReplace = range.length
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= characterCountLimit
    }
    
    func roundButton(for button: UIButton) {
        
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
    }
    
    func toggleUserInterface(textFields: [UITextField], collectionView: UICollectionView) {
        
        textFields.forEach { $0.isEnabled = !$0.isEnabled }
        collectionView.isUserInteractionEnabled = !collectionView.isUserInteractionEnabled
    }
    
    func shouldToggleButtonState(toggle: Bool, with constraints: [NSLayoutConstraint], view: UIView) {
        
        var size: CGFloat = Constants.screenSize.width / 2
        
        if !toggle { size = 15 }
        
        constraints.forEach { $0.constant = size }
        UIView.animate(withDuration: 0.3) { view.layoutIfNeeded() }
    }
    
    func shakeAnimation<T: UIView>(for view: T) where T : Reusable {
        
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 6, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 6, y: view.center.y))
        
        view.layer.add(animation, forKey: "position")
        
//        let animation = CABasicAnimation(keyPath: T.identifier)
//        
//        animation.duration = 0.05
//        animation.repeatCount = 4
//        animation.autoreverses = true
//        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 5, y: view.center.y))
//        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 5, y: view.center.y))
//        
//        view.layer.add(animation, forKey: T.identifier)
    }
}
