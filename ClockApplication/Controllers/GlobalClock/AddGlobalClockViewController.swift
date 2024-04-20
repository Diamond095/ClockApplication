//
//  AddGlobalClockViewController.swift
//  MyProject
//
//  Created by Ivan Basov on 16.04.24.
//

import UIKit

class AddGlobalClockViewController: UIViewController {

    let titleWithAttributes : [NSAttributedString.Key: Any]  = [
        .foregroundColor : UIColor.white]
    
    let textField = SearchTextFieldGlobalClock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Resource.Colors.greyBackgroundColor
        navigationController?.navigationBar.titleTextAttributes = titleWithAttributes
      //  navigationController?.navigationBar. = textField
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: textField)
        view.setupView(textField)
        title = "Select city"
        // Do any additional setup after loading the view.
    }

    func constraintView(){
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }

}
