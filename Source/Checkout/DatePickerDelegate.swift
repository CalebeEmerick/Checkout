//
//  DatePickerDelegate.swift
//  Checkout
//
//  Created by Calebe Emerick on 08/12/16.
//  Copyright © 2016 CalebeEmerick. All rights reserved.
//

import UIKit

final class DatePickerDelegate : NSObject {

    fileprivate let dateComponent = DateComponent()
    fileprivate(set) var selectedMonth = "06"
    fileprivate(set) var selectedYear = "2021"
    fileprivate(set) var apiSelectedMonth = 06
    fileprivate(set) var apiSelectedYear = 2021
}

extension DatePickerDelegate : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return dateComponent.months[row].monthFormatted
        }
        else {
            
            return dateComponent.years[row].yearFormmated
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if component == 0 {
            
            selectedMonth = dateComponent.months[row].monthNumberFormatterd
            apiSelectedMonth = dateComponent.months[row].apiMonth
        }
        else {
            
            selectedYear = dateComponent.years[row].yearFormmated
            apiSelectedYear = dateComponent.years[row].apiYear
        }
    }
}
