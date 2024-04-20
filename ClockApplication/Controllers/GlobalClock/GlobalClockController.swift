//
//  GlobalClock.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//

import Foundation
import UIKit

class GlobalClockController : UIViewController{
    
    let overrideTitle = BaseTitle(Resource.Strings.Titles.worldClock + "s")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupView(overrideTitle)
        configureController()
        let leftNavButton =  addLeftButtonInNavBar("Edit")
        
        addPlusButtonNavBarInRight(selector: #selector(addGlobalClock))
        constraintViews()
    }
    @objc func addGlobalClock(){
       let controller = AddGlobalClockViewController()
       let navController = UINavigationController(rootViewController: controller)
       present(navController, animated: true)
    }
    func constraintViews(){
        NSLayoutConstraint.activate([
            overrideTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overrideTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
        ])
    }
}
