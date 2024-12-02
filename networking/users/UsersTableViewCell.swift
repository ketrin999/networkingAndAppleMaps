//
//  UsersTableViewCell.swift
//  networking
//
//  Created by Ekaterina Yashunina on 16.01.2024.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leanne Graham"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bret"
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 22)
        return label
    }()

    let showGeoBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Узнать геопозицию пользователя", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 12)
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1.5
        button.layer.borderColor = (UIColor(red: 252.0/255.0, green: 183.0/255.0, blue: 71.0/255.0, alpha: 1.0)).cgColor
        button.clipsToBounds = true
        return button
    }()

    weak var delegate: UsersDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        configureNameLabel()
        configureUsernameLabel()
        configureShowGeoBtn()

        showGeoBtn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }

    @objc func buttonClick() {
        delegate?.onButtonClick(cell: self)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureUsernameLabel() {
        contentView.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureShowGeoBtn() {
        contentView.addSubview(showGeoBtn)
        showGeoBtn.translatesAutoresizingMaskIntoConstraints = false
        showGeoBtn.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5).isActive = true
        showGeoBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        showGeoBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
