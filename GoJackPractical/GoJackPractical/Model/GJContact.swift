//
//  GJContact.swift
//  GoJackPractical
//
//  Created by admin on 13/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//
import Foundation

class GJContact: Decodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var profilePic: String?
    var favorite: Bool?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case profilePic = "profile_pic"
        case favorite
        case url
    }
}


