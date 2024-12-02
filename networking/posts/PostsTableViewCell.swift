//
//  PostsTableViewCell.swift
//  networking
//
//  Created by Ekaterina Yashunina on 12.01.2024.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    let postsLabel: UILabel = {
        let label = UILabel()
        label.text = "posts"
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 22)
        return label
    }()

    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "body"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()

    let buttonShowAll: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Смотреть все комментарии", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 12)
        button.setTitleColor(.darkGray, for: .normal)
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 1.5
        button.layer.borderColor = (UIColor(red: 252.0/255.0, green: 183.0/255.0, blue: 71.0/255.0, alpha: 1.0)).cgColor

        button.clipsToBounds = true
        return button
    }()

    weak var delegate: PostsTableViewCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        configurePostsLabel()
        configurebodyLabel()
        configureButtonShowAll()

        buttonShowAll.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }

    @objc func buttonClick() {
        delegate?.onButtonClick(cell: self)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurePostsLabel() {
        contentView.addSubview(postsLabel)
        postsLabel.translatesAutoresizingMaskIntoConstraints = false
        postsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        postsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        postsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configurebodyLabel() {
        contentView.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.topAnchor.constraint(equalTo: postsLabel.bottomAnchor, constant: 2).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    private func configureButtonShowAll() {
        contentView.addSubview(buttonShowAll)
        buttonShowAll.translatesAutoresizingMaskIntoConstraints = false
        buttonShowAll.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 2).isActive = true
        buttonShowAll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        buttonShowAll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
