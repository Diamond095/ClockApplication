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
    
    override func viewDidLoad() {
        configureController()
        view.setupView(overrideTitle)
        let leftNavButton = addLeftButtonInNavBar("Edit")
        constraintViews()
    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
            overrideTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overrideTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        ])
    }
}
