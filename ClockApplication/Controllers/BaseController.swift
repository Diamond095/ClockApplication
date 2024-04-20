//
//  BaseController.swift
//  MyProject
//
//  Created by Ivan Basov on 4.04.24.
//

import Foundation

import UIKit

class BaseController : UIViewController, UIScrollViewDelegate {
    let scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scroll = UIScrollView()
        view.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        scroll.delegate = self
    }
    func configure(){
    }
    func addPlusButtonNavBarInRight(selector : Selector){
        let plus = UIImage(systemName: "plus")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plus,
                                                            style: .done ,
                                                            target: self,
                                                            action: selector)
    }
    func addLeftButtonInNavBar(_ text: String){
        let label = UILabel()
        label.text = text
        label.textColor = .orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
    }
    func addRightButtonInNavBar(_ text: String){
        let label = UILabel()
        label.text = text
        label.textColor = .orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationController?.navigationBar.backgroundColor = .white
       }

}
