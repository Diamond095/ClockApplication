//
//  NavBarController.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//

import UIKit

final class NavBarController: UINavigationController {

    
    override func viewDidLoad(){
        super.viewDidLoad()
        (UIApplication.shared.delegate as! AppDelegate).restrictRotation = .all 
        configure()
    }
    func configure(){
       // view.backgroundColor = .black
        navigationBar.isTranslucent=false
    }

}
