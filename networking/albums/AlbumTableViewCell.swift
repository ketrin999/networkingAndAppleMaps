//
//  AlbumTableViewCell.swift
//  networking
//
//  Created by Ekaterina Yashunina on 18.01.2024.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    let userIdLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()

    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 22)
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "quidem molestiae enim"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        configureUserIdLabel()
        configureIdLabel()
        configureTitleLabel()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUserIdLabel() {
        contentView.addSubview(userIdLabel)
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        userIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        userIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        userIdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureIdLabel() {
        contentView.addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 3).isActive = true
        idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 3).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
