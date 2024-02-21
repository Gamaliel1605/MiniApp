//
//  User.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import Foundation

struct User: Codable {
    let page: Int?
    let data: [ListUser]
}

struct ListUser: Codable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
