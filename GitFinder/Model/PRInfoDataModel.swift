//
//  PRDataModel.swift
//  GitFinder
//
//  Created by Waseem Wani on 27/08/22.
//

import Foundation

struct PRInfoDataModel: Codable {
    let prTitle: String?
    let user: User?
    let prCreatedDate: String?
    let prClosedDate: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case prTitle = "title"
        case user
        case prCreatedDate = "created_at"
        case prClosedDate = "closed_at"
    }
}

struct User: Codable {
    var login: String?
    let userImage: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case userImage = "avatar_url"
    }
}

