//
//  TableView.swift
//  MyProject
//
//  Created by Ivan Basov on 8.04.24.
//

import UIKit

class AlarmTableView: UITableView {

    init(){
        super.init(frame: .zero,style: .plain)
        backgroundColor = .black
        separatorColor = .gray
        separatorStyle = .singleLine
        indicatorStyle = .white
    }
  
    required init?(coder: NSCoder) {
        super.init(frame: .zero,style: .plain)
        backgroundColor = .black
        
    }
  
}

