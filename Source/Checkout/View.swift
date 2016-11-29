//
//  View.swift
//  Checkout
//
//  Created by Calebe Emerick on 28/11/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

public enum Border { case top, right, bottom, left }

public struct View {
    
    public static func setBorder(for view: UIView, kindOf type: Border = .bottom, with thickness: CGFloat = 1, color: CGColor = UIColor.white.cgColor) {
        
        let border = CALayer()
        let frame: CGRect
        let width = view.bounds.width
        let height = view.bounds.height
        
        switch type {
            
        case .top:
            frame = CGRect(x: 0, y: 0, width: width, height: thickness)
        case .right:
            frame = CGRect(x: width - thickness, y: 0, width: thickness, height: height)
        case .bottom:
            frame = CGRect(x: 0, y: height - thickness, width: width, height: thickness)
        case .left:
            frame = CGRect(x: 0, y: 0, width: thickness, height: height)
        }
        
        border.backgroundColor = color
        border.frame = frame
        view.layer.addSublayer(border)
    }
    
    public static func setPlaceholderColor(for textField: UITextField, with text: String, color: UIColor = .white) {
        
        let attributes: [String: Any] = [NSForegroundColorAttributeName: color]
        
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
    }
}
