//
//  Posts.swift
//  networking
//
//  Created by Ekaterina Yashunina on 09.01.2024.
//

import Foundation

struct Posts: Codable {
    let userID, id: Int?
    let title: String?
    let body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
