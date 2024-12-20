//
//  Users.swift
//  networking
//
//  Created by Ekaterina Yashunina on 16.01.2024.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}
