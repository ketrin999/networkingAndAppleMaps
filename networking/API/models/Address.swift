//
//  Address.swift
//  networking
//
//  Created by Ekaterina Yashunina on 17.01.2024.
//

import Foundation

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
