//
//  DatePickerAccessory.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePickerAccessory : UIView {

    @IBOutlet fileprivate weak var selectButton: UIButton!
    @IBAction private func cancelAction(_ sender: UIButton) { didCancel?() }
    @IBAction private func selectAction(_ sender: UIButton) { didSelected?() }
    
    var didCancel: (() -> Void)?
    var didSelected: (() -> Void)?
}

extension DatePickerAccessory {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectButton.layer.cornerRadius = 5
        selectButton.clipsToBounds = true
    }
}
