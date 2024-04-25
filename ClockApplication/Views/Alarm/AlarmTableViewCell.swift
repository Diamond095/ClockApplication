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
        label.text = "06:00"
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
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
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        frame = .zero
        backgroundColor = .black
        selectionStyle = .none
       // textLabel?.text = "06:00"
        textLabel?.font = UIFont.systemFont(ofSize: 60, weight: .light)
        textLabel?.textColor = .gray
        setupViews()
        configure()
        switchView.addTarget(self, action: #selector(changeStyle), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupView(secondLabel)
        setupView(switchView)
        setupView(firstLabel)
    }
    func configure(){
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            firstLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            secondLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor),
            
            switchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            switchView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),

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
