//
//  FirebaseDataManager.swift
//  PiPi
//
//  Created by 정상윤 on 8/1/24.
//

import Foundation
import Firebase
import FirebaseDatabase

final class FirebaseDataManager {
    
    static let shared = FirebaseDataManager()
    
    private let databaseURL = "https://koatmilk-9a443-default-rtdb.firebaseio.com"
    
    private var ref: DatabaseReference {
        Database.database(url: databaseURL).reference()
    }
    
    private init() {}
    
    func addData<T: Encodable>(_ data: T, type: DataType, id: String) throws {
        let data = try JSONEncoder().encode(data)
        let jsonString = try JSONSerialization.jsonObject(with: data)
        
        ref.child(type.key)
            .child(id)
            .setValue(jsonString)
    }
    
}

extension FirebaseDataManager {
    
    enum DataType {
        case activity
        case user
        case ticket
        
        var key: String {
            switch self {
            case .activity:
                "activities"
            case .user:
                "users"
            case .ticket:
                "tickets"
            }
        }
    }
    
}
