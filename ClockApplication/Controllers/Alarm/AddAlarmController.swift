//
//  AddAlarmController.swift
//  MyProject
//
//  Created by Ivan Basov on 5.04.24.
//

import UIKit

class AddAlarmController: UIViewController {

 
    weak var delegate : AddAlarmControllerDelegate?
    let stackView : UIStackView = {
        let button = UIButton()
       let stackView = UIStackView(arrangedSubviews: [button])
        stackView.spacing = 10
        return stackView
    }()

    let titleWithAttributes : [NSAttributedString.Key: Any]  = [
        .foregroundColor : UIColor.white]
    let timePicker = AlarmTimePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupView(timePicker)
        view.setupView(stackView)
        let leftNavButton = addLeftButtonInNavBar("Cancel")
        let rightNavButton =  addRightButtonInNavBar("Save")
        leftNavButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        navigationController?.navigationBar.titleTextAttributes = titleWithAttributes
        title = "Add alarm"
        view.backgroundColor = Resource.Colors.greyBackgroundColor
        constraintsView()
        
    }
    
    func constraintsView(){
        NSLayoutConstraint.activate([
            timePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.97)
        ]);
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil) 
    }

}
