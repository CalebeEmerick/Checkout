//
//  DatePickerDelegate.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePickerDelegate : NSObject {

    var valityDate: ValityDate?
}

extension DatePickerDelegate : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return valityDate?.months[row].monthFormatted
        }
        else {
            
            return valityDate?.years[row].yearFormmated
        }
    }
}
