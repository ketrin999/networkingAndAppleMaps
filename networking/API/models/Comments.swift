//
//  Comments.swift
//  networking
//
//  Created by Ekaterina Yashunina on 16.01.2024.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
