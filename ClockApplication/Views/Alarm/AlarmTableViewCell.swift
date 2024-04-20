//
//  TableViewCell.swift
//  MyProject
//
//  Created by Ivan Basov on 8.04.24.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    let firstLabel : UILabel = {
        let label = UILabel()
        label.text = "Ячейка1"
        label.textColor = .red
        return label
    }()
    let secondLabel : UILabel = {
        let label = UILabel()
        label.text = "Ячейка2"
        label.textColor = .red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame = .zero
        backgroundColor = .black
        selectionStyle = .none
        setupViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupView(firstLabel)
        setupView(secondLabel)
    }
    private func configure(){
        NSLayoutConstraint.activate([
            firstLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            firstLabel.topAnchor.constraint(equalTo: topAnchor),
            firstLabel.heightAnchor.constraint(equalToConstant: 15),
                        
            secondLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 50),
            secondLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            secondLabel.heightAnchor.constraint(equalToConstant: 15)

        ])
    }
    
}
