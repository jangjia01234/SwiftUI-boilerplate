//
//  Activity.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import Foundation

struct Activity: Identifiable {
    
    let id: UUID = .init()
    let title: String
    let description: String
    let maxPeopleNumber: Int
    let currentPeopleNumber: Int = 0
    let category: Category
    let startDateTime: Date
    let estimatedTime: Int?
    let coordinates: Coordinates
    
}

extension Activity {
    
    enum Category: String, CaseIterable {
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
