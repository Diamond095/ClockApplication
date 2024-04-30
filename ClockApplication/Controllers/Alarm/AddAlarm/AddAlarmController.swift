//
//  AddAlarmController.swift
//  MyProject
//
//  Created by Ivan Basov on 5.04.24.
//

import UIKit


final class AddAlarmController: UIViewController {

 
    weak var delegate : AddAlarmControllerDelegate?
    let timePicker = AlarmTimePicker()
    let table =  OptionalTableView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupView(timePicker)
        view.setupView(table)
        table.dataSource = self
        table.delegate = self
        let leftNavButton = addLeftButtonInNavBar("Cancel")
        let rightNavButton =  addRightButtonInNavBar("Save")
        leftNavButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        setTitle(title: "Add alarm")
        view.backgroundColor = .grayBackground
        constraintsView()
        
    }
    
    func constraintsView(){
        NSLayoutConstraint.activate([
            timePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            timePicker.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),

            table.topAnchor.constraint(equalTo: timePicker.bottomAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]);
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil) 
    }

}
extension AddAlarmController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = OptionalTableCell(mode: .withController, mainLabel: "Repeat", controllerOption: "Never", presentController: ChooseRepeatController())
            return cell
        case 1:
            let cell = OptionalTableCell(mode: .withTextField, mainLabel: "Name", placeholder: "Alarm")
            return cell
        case 2:
            let cell = OptionalTableCell(mode: .withController, mainLabel: "Melody", controllerOption: "Radar", presentController: ChooseMelodyController())
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(ChooseRepeatController(), animated: true)
        case 2:
            navigationController?.pushViewController(ChooseMelodyController(), animated: true)
        default:
            break
        }
        
    }

    
}
