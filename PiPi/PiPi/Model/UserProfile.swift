//
//  UserProfile.swift
//  PiPi
//
//  Created by 신혜연 on 8/3/24.
//

import Foundation

struct UserProfile: Identifiable, Codable {
    
    var id: String
    var nickname: String
    var affiliation: String
    var address: String
    var level: String
}
