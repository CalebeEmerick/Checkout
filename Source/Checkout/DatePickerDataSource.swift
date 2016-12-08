//
//  DatePickerDataSource.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePickerDataSource : NSObject {

    fileprivate let dateComponent = DateComponent()
}

extension DatePickerDataSource : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return dateComponent.months.count
        }
        else {
            
            return dateComponent.years.count
        }
    }
}
