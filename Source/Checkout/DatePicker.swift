//
//  DatePicker.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePicker : UIView {

    @IBOutlet fileprivate weak var picker: UIPickerView!
    
    fileprivate let dataSource = DatePickerDataSource()
    fileprivate let delegate = DatePickerDelegate()
    fileprivate let valityDate = ValityDate()
}

extension DatePicker {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource.valityDate = valityDate
        delegate.valityDate = valityDate
        picker.dataSource = dataSource
        picker.delegate = delegate
    }
}
