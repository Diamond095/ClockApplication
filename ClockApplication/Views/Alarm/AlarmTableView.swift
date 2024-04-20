//
//  TableView.swift
//  MyProject
//
//  Created by Ivan Basov on 8.04.24.
//

import UIKit

class AlarmTableView: UITableView {

    init(frame : CGRect){
        super.init(frame: .zero,style: .plain)
        self.backgroundColor = .black
    }
  
    required init?(coder: NSCoder) {
        super.init(frame: .zero,style: .plain)
        self.backgroundColor = .black
        self.translatesAutoresizingMaskIntoConstraints = false
    }
  
}

