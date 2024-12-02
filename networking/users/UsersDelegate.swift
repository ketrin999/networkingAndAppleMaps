//
//  UsersDelegate.swift
//  networking
//
//  Created by Ekaterina Yashunina on 17.01.2024.
//

import Foundation

protocol UsersDelegate: AnyObject {
    func onButtonClick(cell: UsersTableViewCell)
}
