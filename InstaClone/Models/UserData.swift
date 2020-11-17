//
//  UserData.swift
//  InstaClone
//
//  Created by MacBook on 17/11/2020.
//

import Foundation

struct UserData: Identifiable, Codable {
    
    var id: String
    var username: String
    var followers: [String]
    var following: [String]
    
}
