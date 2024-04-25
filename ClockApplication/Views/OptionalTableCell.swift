//
//  StackViewCell.swift
//  ClockApplication
//
//  Created by Ivan Basov on 20.04.24.
//

import UIKit


class OptionalTableCell: UITableViewCell {

    enum Mode {
        case withTextField
        case withController
        case withSwitch
    }
    
    let mainLabel = UILabel()
    let textField = UITextField()
    let switchView = UISwitch()
    let controllerLabel = UILabel()
    let arrow = UIImageView(image: UIImage(systemName: "chevron.right"))
    
    init(mode: Mode, mainLabel: String, placeholder: String? = nil, controllerOption: String? = nil, presentController: UIViewController? = nil){
        super.init(style: .default, reuseIdentifier: nil)
        self.mainLabel.text = mainLabel
        self.mainLabel.textColor = .white
        textField.textColor = .veryLightGray
        controllerLabel.textColor = .veryLightGray
        selectionStyle = .none
        controllerLabel.text = controllerOption
        backgroundColor = .customDarkGray
        textField.text = placeholder
        arrow.tintColor = .gray
        setupViews(mode: mode)
        configureViews(mode: mode)
    }
    func setupViews(mode: Mode){
        setupView(mainLabel)
        switch mode{
        case .withSwitch:
            setupView(switchView)
        case .withController:
            setupView(arrow)
            setupView(controllerLabel)
        case .withTextField:
            setupView(textField)
        }
    }
    func configureViews(mode: Mode){
        mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        switch mode {
        case .withController:
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
            arrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            controllerLabel.trailingAnchor.constraint(equalTo: arrow.trailingAnchor, constant: -15).isActive = true
            controllerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        case .withSwitch:
            switchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
            switchView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            switchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        case .withTextField:
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
