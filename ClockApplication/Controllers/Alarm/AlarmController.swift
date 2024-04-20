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

class AlarmController : UIViewController{

    let table = AlarmTableViewController()
    let overrideTitle = BaseTitle(Resource.Strings.Titles.alarm + "s")
    let titleWithAttributes : [NSAttributedString.Key: Any]  = [
        .foregroundColor : UIColor.white]
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        view.backgroundColor = .black
        topColouredBlack()
        table.tableView = AlarmTableView(frame: .zero)
        title = Resource.Strings.Titles.alarm
        navigationController?.navigationBar.titleTextAttributes = titleWithAttributes
        navigationController?.tabBarItem.title=Resource.Strings.Titles.alarm
        
        let button = addLeftButtonInNavBar("Edit")
        addPlusButtonNavBarInRight(selector: #selector(addAlarm))
        scrollView.delegate = self
        table.tableView.register(AlarmTableViewCell.self, forCellReuseIdentifier: "AlarmTableViewCell")
        view.setupView(overrideTitle)
        view.setupView(table.tableView)
        constraintsView()
    
    }
    @objc func addAlarm(){
        let addAlarmController = AddAlarmController()
        let navBarController = UINavigationController(rootViewController: addAlarmController)
        present(navBarController, animated: true)
    }
    
  func constraintsView(){
        NSLayoutConstraint.activate([
            overrideTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            overrideTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            table.tableView.topAnchor.constraint(equalTo: overrideTitle.topAnchor, constant: 20),
            table.tableView.leadingAnchor.constraint(equalTo: overrideTitle.leadingAnchor, constant: 0),
            table.tableView.heightAnchor.constraint(equalToConstant: 1000)
        ]);
      
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            title = Resource.Strings.Titles.alarm
        }
        else {
            title = nil
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
}
