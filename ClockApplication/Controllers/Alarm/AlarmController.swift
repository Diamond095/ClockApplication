//
//  AlarmController.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//

import Foundation

import UIKit

protocol AddAlarmControllerDelegate : AnyObject{
    func addLabel()
}

    
final class AlarmController : UIViewController {
    
    let overrideTitle = BaseTitle(Resource.Strings.Titles.alarm + "s")
    let titleWithAttributes : [NSAttributedString.Key: Any]  = [
        .foregroundColor : UIColor.white]
    let scrollView = UIScrollView()
    let table = AlarmTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        view.backgroundColor = .black
        topColouredBlack()
        view.setupView(table)
        //title = Resource.Strings.Titles.alarm
        navigationController?.navigationBar.titleTextAttributes = titleWithAttributes
        navigationController?.tabBarItem.title=Resource.Strings.Titles.alarm
        let leftNavButton = addLeftButtonInNavBar("Edit")
        leftNavButton.addTarget(self, action: #selector(editAlarms), for: .touchDown)
        table.register(AlarmTableViewCell.self, forCellReuseIdentifier: "AlarmTableViewCell")
        table.dataSource = self
        table.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        addPlusButtonNavBarInRight(selector: #selector(addAlarm))
        //view.setupView(overrideTitle)
        constraintsView()
    
    }
    @objc func addAlarm(){
        let addAlarmController = AddAlarmController()
        let navBarController = UINavigationController(rootViewController: addAlarmController)
        present(navBarController, animated: true)
    }
    
  func constraintsView(){
        NSLayoutConstraint.activate([
           // overrideTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
           // overrideTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]);
      
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
          navigationItem.title = Resource.Strings.Titles.alarm
        }
        else {
            navigationItem.title = nil
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView)
    {
        topColouredBlack()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool)
    {
      // topColouredWhite()
    }
    @objc func editAlarms(sender: UIButton){
        table.isEditing.toggle()
        navigationItem.leftBarButtonItem?.title = isEditing ? "Done" : "Edit"
        
        
    }
}

extension AlarmController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 30
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell" , for: indexPath) as?  AlarmTableViewCell
        else { fatalError() }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .left)
    }
    
    
}

