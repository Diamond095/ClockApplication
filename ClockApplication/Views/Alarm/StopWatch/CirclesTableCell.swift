//
//  CirclesTableCell.swift
//  ClockApplication
//
//  Created by Ivan Basov on 23.04.24.
//

import UIKit

class CirclesTableCell: UITableViewCell {

    let nameLabel = UILabel()
    let timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.text = "Circle 1"
        timeLabel.text = "00:00,00"
        nameLabel.textColor = .white
        timeLabel.textColor = .white
        backgroundColor = .black
        selectionStyle = .none
        setupViews()
        constraintView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupViews(){
       // setupView(nameLabel)
        setupView(timeLabel)
    }
    func constraintView(){
        NSLayoutConstraint.activate([
            //nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //  nameLabel.leadingAnchor.constraint(equalTo:contentView.leadingAnchor),
            
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15)
        ])
    }
}
