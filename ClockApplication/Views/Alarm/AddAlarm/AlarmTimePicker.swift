//
//  AlarmTimePicker.swift
//  MyProject
//
//  Created by Ivan Basov on 15.04.24.
//

import UIKit

class AlarmTimePicker: UIDatePicker {

    
    init(){
        super.init(frame: .zero)
        tintColor = Resource.Colors.lightGrey
        datePickerMode = .time
        preferredDatePickerStyle = .wheels
        setValue(Resource.Colors.lightGrey, forKey: "textColor")
        setValue(Resource.Colors.dirtyWhite, forKey: "tintColor")
        setValue(false, forKey: "highlightsToday")
        addTarget(self, action: #selector(changeColor) , for: .valueChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func changeColor(){
        setValue(Resource.Colors.dirtyWhite, forKey: "textColor")
        setValue(Resource.Colors.dirtyWhite, forKey: "tintColor")
        print(1)
    }
    
}
