//
//  DueTableViewCell.swift
//  networking
//
//  Created by Ekaterina Yashunina on 12.01.2024.
//

import UIKit

class DueTableViewCell: UITableViewCell {

    let dueEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "@email"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()

    let duePostsLabel: UILabel = {
        let label = UILabel()
        label.text = "posts"
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 22)
        return label
    }()

    let dueBodyLabel: UILabel = {
        let label = UILabel()
        label.text = "body"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureEmailLabelDue()
        configurePostsLabelDue()
        configureBodyLabelDue()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureEmailLabelDue() {
        contentView.addSubview(dueEmailLabel)
        dueEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        dueEmailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        dueEmailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dueEmailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configurePostsLabelDue() {
        contentView.addSubview(duePostsLabel)
        duePostsLabel.translatesAutoresizingMaskIntoConstraints = false
        duePostsLabel.topAnchor.constraint(equalTo: dueEmailLabel.bottomAnchor, constant: 3).isActive = true
        duePostsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        duePostsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureBodyLabelDue() {
        contentView.addSubview(dueBodyLabel)
        dueBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        dueBodyLabel.topAnchor.constraint(equalTo: duePostsLabel.bottomAnchor, constant: 3).isActive = true
        dueBodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        dueBodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        dueBodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
