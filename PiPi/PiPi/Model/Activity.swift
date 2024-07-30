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
    let endDateTime: Date?
    let latitude: Double
    let longitude: Double
    
}

extension Activity {
    
    enum Category {
        case meal
        case cafe
        case alcohol
        case sport
        case study
    }
    
}
