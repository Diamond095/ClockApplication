//
//  BaseTitle.swift
//  MyProject
//
//  Created by Ivan Basov on 12.04.24.
//

import UIKit

class BaseTitle: UILabel {

    init(_ title : String){
     super.init(frame: .zero)
     text = title
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(){
        self.font = UIFont.boldSystemFont(ofSize: 30)
        self.textColor = .white
    }
    
    
}
