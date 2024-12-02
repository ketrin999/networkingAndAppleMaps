//
//  PhotoTableViewCell.swift
//  networking
//
//  Created by Ekaterina Yashunina on 29.01.2024.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "accusamus beatae ad facilis cum similique qui sunt"
        label.font = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 18)
        return label
    }()

    let imgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "person.2.crop.square.stack"))
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.clipsToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        configureTitleLabel()
        configureImageView()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }

    private func configureImageView() {
        contentView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
