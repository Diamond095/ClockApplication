//
//  AddAlarmController.swift
//  MyProject
//
//  Created by Ivan Basov on 5.04.24.
//

import UIKit


final class AddAlarmController: UIViewController {

 
    weak var delegate : AddAlarmControllerDelegate?
    let titleWithAttributes : [NSAttributedString.Key: Any]  = [
        .foregroundColor : UIColor.white]
    let timePicker = AlarmTimePicker()
    let table =  OptionalTableView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupView(timePicker)
       // view.setupView(stackView)
        view.setupView(table)
        table.dataSource = self
        table.delegate = self
        let leftNavButton = addLeftButtonInNavBar("Cancel")
        let rightNavButton =  addRightButtonInNavBar("Save")
        leftNavButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        navigationController?.navigationBar.titleTextAttributes = titleWithAttributes
        title = "Add alarm"
        view.backgroundColor = .grayBackground
        constraintsView()
        
    }
    
    func constraintsView(){
        NSLayoutConstraint.activate([
            timePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
          //  stackView.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 10),
           // stackView.leadingAnchor.constraint(equalTo: timePicker.leadingAnchor),
           // stackView.widthAnchor.constraint(equalTo: timePicker.widthAnchor)
            table.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: 10),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            table.leadingAnchor.constraint(equalTo: timePicker.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95)
        ]);
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil) 
    }

}
extension AddAlarmController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = OptionalTableCell(mode: .withController, mainLabel: "Repeat", controllerOption: "Never")
            return cell
        case 1:
            let cell = OptionalTableCell(mode: .withTextField, mainLabel: "Name", placeholder: "Alarm")
            return cell
        case 2:
            let cell = OptionalTableCell(mode: .withController, mainLabel: "Melody", controllerOption: "Radar")
            return cell
        case 3:
            let cell = OptionalTableCell(mode: .withSwitch, mainLabel: "Repeat signal")
            return cell
        default:
            return UITableViewCell()
            
        }
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OptionalTableView.automaticDimension
    }

    
}
