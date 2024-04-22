//
//  TimerController.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//

import Foundation

import UIKit

class TimerController : UIViewController {
   
    let overrideTitle = BaseTitle(Resource.Strings.Titles.timer + "s")
    let cancelButton = BaseButton(style: .gray, mode: .title, title: "Cancel")
    let startButton = BaseButton(style: .green, mode: .title, title: "Start")
    let timePicker = UIPickerView(frame:.zero)
    
    override func viewDidLoad() {
        configureController()
        setupViews()
        startButton.layoutSubviews()
        cancelButton.layoutSubviews()
        timePicker.delegate = self
        timePicker.dataSource = self
        timePicker.setValue(Resource.Colors.dirtyWhite, forKey: "textColor")
        timePicker.selectRow(59, inComponent: 1, animated: false)
        let leftNavButton = addLeftButtonInNavBar("Edit")
        constraintViews()
    }
    func setupViews(){
        view.setupView(overrideTitle)
        view.setupView(timePicker)
        view.setupView(cancelButton)
        view.setupView(startButton)
    }
    func constraintViews(){
        NSLayoutConstraint.activate([
            overrideTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overrideTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            timePicker.leadingAnchor.constraint(equalTo: overrideTitle.leadingAnchor, constant: 0),
            timePicker.topAnchor.constraint(equalTo: overrideTitle.topAnchor, constant: 20),
            timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            cancelButton.leadingAnchor.constraint(equalTo: overrideTitle.leadingAnchor, constant: 0),
            cancelButton.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 20),
            
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startButton.topAnchor.constraint(equalTo: cancelButton.topAnchor, constant: 0)
            
        ])
    }
}

extension TimerController :  UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1:
            return 60
        case 2:
            return 60
        default:
             return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
        case 0:
            return "\(row) h"
        case 1:
            return "\(row) min"
        case 2:
            return "\(row) sec"
        default:
             return nil
        }
    }
}
