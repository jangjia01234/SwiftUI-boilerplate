//
//  Activity.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import Foundation

struct Activity: Identifiable {
    
    let id: String
    let hostID: String
    let title: String
    let description: String
    let maxPeopleNumber: Int
    let participantID: [String]
    let category: Category
    let startDateTime: Date
    let estimatedTime: Int?
    let coordinates: Coordinates
    
    init(
        id: String = UUID().uuidString,
        hostID: String,
        title: String,
        description: String,
        maxPeopleNumber: Int,
        participantID: [String] = [],
        category: Category,
        startDateTime: Date,
        estimatedTime: Int?,
        coordinates: Coordinates
    ) {
        self.id = id
        self.hostID = hostID
        self.title = title
        self.description = description
        self.maxPeopleNumber = maxPeopleNumber
        self.participantID = participantID
        self.category = category
        self.startDateTime = startDateTime
        self.estimatedTime = estimatedTime
        self.coordinates = coordinates
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.hostID = try container.decode(String.self, forKey: .hostID)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.maxPeopleNumber = try container.decode(Int.self, forKey: .maxPeopleNumber)
        self.participantID = try container.decodeIfPresent([String].self, forKey: .participantID) ?? []
        self.category = try container.decode(Category.self, forKey: .category)
        self.startDateTime = try container.decode(Date.self, forKey: .startDateTime)
        self.estimatedTime = try container.decodeIfPresent(Int.self, forKey: .estimatedTime) ?? nil
        self.coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
    }
    
    func addingParticipant(_ participant: String) -> Activity {
        Activity(
            id: id,
            hostID: hostID,
            title: title,
            description: description,
            maxPeopleNumber: maxPeopleNumber,
            participantID: participantID + [participant],
            category: category,
            startDateTime: startDateTime,
            estimatedTime: estimatedTime,
            coordinates: coordinates
        )
    }
    
}

extension Activity: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case hostID = "host_id"
        case title
        case description
        case maxPeopleNumber = "max_people_number"
        case participantID = "participant_id"
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
    }
    
}
