//
//  BaseGroupedTableView.swift
//  ClockApplication
//
//  Created by Ivan Basov on 21.04.24.
//

import UIKit

class OptionalTableView: UITableView {

    init(){
        super.init(frame: .zero, style: .insetGrouped)
        backgroundColor = .grayBackground
        clipsToBounds = true
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
