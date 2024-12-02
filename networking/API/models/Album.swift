//
//  Album.swift
//  networking
//
//  Created by Ekaterina Yashunina on 18.01.2024.
//

import Foundation

struct Album: Codable {
    let userID: Int
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}
