//
//  UIView + ext.swift
//  MyProject
//
//  Created by Ivan Basov on 8.04.24.
//

import Foundation

import UIKit

extension UIView {
    @objc func setupView(_ view: UIView) {
        addSubview(view)
          view.translatesAutoresizingMaskIntoConstraints = false
      }
}
