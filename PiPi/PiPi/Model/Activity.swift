//
//  Activity.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import Foundation

struct Activity: Identifiable {
    
    let id: String = UUID().uuidString
    let hostID: String
    let title: String
    let description: String
    let maxPeopleNumber: Int
    let currentPeopleNumber: Int = 0
    let category: Category
    let startDateTime: Date
    let estimatedTime: Int?
    let coordinates: Coordinates
    
}

extension Activity: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case hostID = "host_id"
        case title
        case description
        case maxPeopleNumber = "max_people_number"
        case currentPeopleNumber = "current_people_number"
        case category
        case startDateTime = "start_date_time"
        case estimatedTime = "estimated_time"
        case coordinates
    }
    
}

extension Activity {
    
    enum Category: String, CaseIterable, Codable {
        case meal = "밥"
        case cafe = "카페"
        case alcohol = "술"
        case sport = "운동"
        case study = "공부"
        
        var imageName: String {
            switch self {
            case .meal:
                "fork.knife"
            case .cafe:
                "cup.and.saucer.fill"
            case .alcohol:
                "wineglass.fill"
            case .sport:
                "sportscourt.fill"
            case .study:
                "pencil"
            }
        }
    }
    
}
