//
//  MenuOptionTableViewCell.swift
//  SideMenu
//
//  Created by Julio Collado on 12/9/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class MenuOptionTableViewCell: UITableViewCell {
    
    static let identifier = "MenuOptionTableViewCell"
    
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        return iconImageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Text"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupIconImageView()
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor), descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10), descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 20)].forEach{ $0.isActive = true}
    }
    
    func setupIconImageView() {
        backgroundColor = .darkGray
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        [iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor), iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20), iconImageView.heightAnchor.constraint(equalToConstant: 24), iconImageView.widthAnchor.constraint(equalToConstant: 24)].forEach{ $0.isActive = true}
    }
}
