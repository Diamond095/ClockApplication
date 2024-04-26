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
        case withDefaultsOptions
    }
    
    let mainLabel = UILabel()
    let textField = UITextField()
    let switchView = UISwitch()
    let controllerLabel = UILabel()
    let arrow = UIImageView(image: UIImage(systemName: "chevron.right"))
    var isElementVisible = false
    let checkmark = UIImageView(image: UIImage(systemName: "checkmark"))
    
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
        setupCheckMark()
        checkmark.isHidden = true
    }
    func setupViews(mode: Mode){
        setupView(mainLabel)
        switch mode{
        case .withSwitch:
            setupView(mainLabel)
            setupView(switchView)
        case .withController:
            setupView(mainLabel)
            setupView(arrow)
            setupView(controllerLabel)
        case .withTextField:
            setupView(mainLabel)
            setupView(textField)
        case .withDefaultsOptions:
            setupView(mainLabel)
        }
    }
    func configureViews(mode: Mode){
        switch mode {
        case .withController:
            setConstraintsForMainLabel()
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
            arrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            controllerLabel.trailingAnchor.constraint(equalTo: arrow.trailingAnchor, constant: -15).isActive = true
            controllerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        case .withSwitch:
            setConstraintsForMainLabel()
            switchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
            switchView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            switchView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
        case .withTextField:
            setConstraintsForMainLabel()
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        case .withDefaultsOptions:
           setConstraintsForMainLabel()
        }
    }
    private func setConstraintsForMainLabel(){
        mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func toggleCheckMark(){
        if isElementVisible{
            isElementVisible = !isElementVisible
            checkmark.isHidden = true
        }
        else {
            checkmark.isHidden = false
            isElementVisible = !isElementVisible
        }
    }
    
    private func setupCheckMark(){
        checkmark.tintColor = .systemOrange
        setupView(checkmark)
        checkmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        checkmark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        checkmark.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        checkmark.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkmark.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
