//
//  BaseButton.swift
//  ClockApplication
//
//  Created by Ivan Basov on 19.04.24.
//

import UIKit

class BaseButton: UIButton {

    enum Style {
        case grey
        case green
        case orange
        case red
    }
    enum Mode {
        case title
        case play
        case pause
        case 
    }
    init(style: Style, mode: Mode, title: String?, textLabel: String){
        let label = UILabel()
        label.text = textLabel
        switch Style {
        case .grey:
                backgroundColor = 
        case .green:
        case .orange:
        case .red:
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
