//
//  BaseView.swift
//  MyProject
//
//  Created by Ivan Basov on 8.04.24.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        constaintViews()
        configureAppearance()
    }
}

extension BaseView  {
    func setupViews() {}
    func constaintViews() {}
    func configureAppearance() {
          backgroundColor = .black
      }
}
