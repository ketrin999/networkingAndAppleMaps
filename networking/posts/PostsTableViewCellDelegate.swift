//
//  PostsTableViewCellDelegate.swift
//  networking
//
//  Created by Ekaterina Yashunina on 12.01.2024.
//

import Foundation

protocol PostsTableViewCellDelegate: AnyObject {
    func onButtonClick(cell: PostsTableViewCell)
}
