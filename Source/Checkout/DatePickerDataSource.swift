//
//  DatePickerDataSource.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePickerDataSource : NSObject {

    var valityDate: ValityDate?
}

extension DatePickerDataSource : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        guard let monthsCount = valityDate?.months.count else { return 0 }
        guard let yearsCount = valityDate?.years.count else { return 0 }
        
        if component == 0 {
            
            return monthsCount
        }
        else {
            
            return yearsCount
        }
    }
}
