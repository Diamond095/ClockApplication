//
//  BaseButton.swift
//  ClockApplication
//
//  Created by Ivan Basov on 19.04.24.
//

import UIKit

enum Style {
    case gray
    case green
    case orange
    case red
}
enum Mode {
    case title
    case play
    case pause
    case continueCase
}

class BaseButton: UIButton {

    init(style: Style, mode: Mode, title: String?){
        super.init(frame: .zero)
        layer.cornerRadius = 45
        setupButton(style: style, mode: mode, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 90),
            self.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    func setupButton(style: Style, mode: Mode, title: String?){
        switch mode {
        case .title:
            setTitle(title, for: .normal)
            switch style {
            case .gray:
                backgroundColor = Resource.Colors.darkGrey
                setTitleColor(.gray, for: .normal)
            case .green:
                backgroundColor = Resource.Colors.darkGreen
                setTitleColor(.green, for: .normal)
            case .red:
                backgroundColor = Resource.Colors.darkRed
                setTitleColor(.red, for: .normal)
            case .orange:
                backgroundColor = Resource.Colors.darkOrange
            }
        case .play:
            backgroundColor = Resource.Colors.darkGreen
            setImage(Resource.Images.Icons.play, for: .normal)
        case .pause:
            setImage(Resource.Images.Icons.pause, for: .normal)
            backgroundColor = .black
        case .continueCase:
            setImage(Resource.Images.Icons.continueImage, for: .normal)
            backgroundColor = .black
        }
    }
}
