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
        label.text = "6:00"
        label.font = UIFont.systemFont(ofSize: 70, weight: .light)
        label.textColor = .gray
        return label
    }()
    let secondLabel : UILabel = {
        let label = UILabel()
        label.text = "Alarm"
        label.textColor =  .gray
        return label
    }()
    let switchView : UISwitch = {
        let switchView = UISwitch()
        switchView.onTintColor = .lightGray
        return switchView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        frame = .zero
        backgroundColor = .black
        selectionStyle = .none
        setupViews()
        configure()
        switchView.addTarget(self, action: #selector(changeStyle), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupView(firstLabel)
        setupView(secondLabel)
        setupView(switchView)
    }
    func configure(){
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 300),
            firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                        
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor),
            
            switchView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            switchView.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 30)

        ])
    }
    @objc private func changeStyle(target: UISwitch){
        if target.isOn{
            switchView.onTintColor = .lightGray
        }
        else{
            
        }
    }
}
