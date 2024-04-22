//
//  UIViewController + ext.swift
//  MyProject
//
//  Created by Ivan Basov on 15.04.24.
//

import Foundation
import UIKit

extension UIViewController : UIScrollViewDelegate
{
  func topColouredBlack()
  {
     let colouredTopBlack = UIView()
     view.addSubview(colouredTopBlack)
     colouredTopBlack.translatesAutoresizingMaskIntoConstraints = false
     colouredTopBlack.backgroundColor = .black

     NSLayoutConstraint.activate([
        colouredTopBlack.topAnchor.constraint(equalTo: view.topAnchor),
        colouredTopBlack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        colouredTopBlack.widthAnchor.constraint(equalTo: view.widthAnchor),
    ])
  }
    func addPlusButtonNavBarInRight(selector : Selector){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Resource.Images.Icons.plus,
                                                            style: .done,
                                                            target: self,
                                                            action: selector)
        navigationItem.rightBarButtonItem?.tintColor = .orange
    }
    
    func configureController(){
        let scroll = UIScrollView()
        view.backgroundColor = .black
        navigationController?.navigationBar.backgroundColor = .black
        scroll.delegate = self
    }
    func addLeftButtonInNavBar(_ text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.orange, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        return button
    }
    func addRightButtonInNavBar(_ text: String) -> UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.orange, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        return button
    }
}
