//
//  SearchTextFieldGlobalClock.swift
//  MyProject
//
//  Created by Ivan Basov on 16.04.24.
//

import UIKit

class SearchTextFieldGlobalClock: UITextField {

    init(){
        super.init(frame: .zero)
        text = "Search"
        textColor = Resource.Colors.dirtyWhite
        backgroundColor = Resource.Colors.lightGrey
        layer.cornerRadius = 10
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
