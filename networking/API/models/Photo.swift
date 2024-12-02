//
//  Photo.swift
//  networking
//
//  Created by Ekaterina Yashunina on 29.01.2024.
//

import Foundation

struct Photo: Codable {
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
