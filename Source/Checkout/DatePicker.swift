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
    let delegate = DatePickerDelegate()
//    var valityDate: ((ValityDate) -> Void)?
}

extension DatePicker {
    
    override func awakeFromNib() {
        super.awakeFromNib()

//        delegate.selectedValityDate = { [weak self] valityDate in  }
        picker.dataSource = dataSource
        picker.delegate = delegate
        picker.selectRow(5, inComponent: 0, animated: true)
        picker.selectRow(5, inComponent: 1, animated: true)
    }
}
