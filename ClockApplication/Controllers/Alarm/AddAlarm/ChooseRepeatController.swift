//
//  ChooseRepeatController.swift
//  ClockApplication
//
//  Created by Ivan Basov on 24.04.24.
//

import UIKit

class ChooseRepeatController: UIViewController {

    let repeats = RepeatAlarm.createRepeats()
    let table = OptionalTableView()
    var indexOfCheckMark : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .grayBackground
        setTitle(title: "Repeat")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        table.delegate = self
        table.dataSource = self
        view.setupView(table)
        constraintsView()
       // table.register(OptionalTableCell.self, forCellReuseIdentifier: "Repeat")
        // Do any additional setup after loading the view.
    }
    
    
    func constraintsView(){
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


extension ChooseRepeatController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repeats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OptionalTableCell(mode: .withDefaultsOptions, mainLabel: repeats[indexPath.row].name)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? OptionalTableCell {
            switch  indexOfCheckMark {
            case nil:
                cell.toggleCheckMark()
                indexOfCheckMark = indexPath
            case indexPath:
                cell.toggleCheckMark()
                indexOfCheckMark = nil
            default:
                if let previousCellWithCheckMark = tableView.cellForRow(at: indexOfCheckMark!) as? OptionalTableCell {
                    previousCellWithCheckMark.toggleCheckMark()
                    cell.toggleCheckMark()
                    indexOfCheckMark = indexPath
                }
            }
        }
        
    }
    
    
}
