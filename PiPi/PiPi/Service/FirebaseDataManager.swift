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
    
    func fetchData<T: Decodable>(type: DataType, id: String, completion: @escaping (Result<T, Error>) -> Void) {
        ref.child(type.key)
            .child(id)
            .observeSingleEvent(of: .value) { snapshot in
                if snapshot.exists() {
                    guard let value = snapshot.value as? [String: Any] else {
                        completion(.failure(FirebaseError.dataNotFound))
                        return
                    }
                    
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: [])
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        print("Decoding error: \(error)")
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(FirebaseError.dataNotFound))
                    print("No data available for the provided ID.")
                }
            }
    }
    
    func updateData<T: Encodable>(_ data: T, type: DataType, id: String) throws {
        let data = try JSONEncoder().encode(data)
        let jsonString = try JSONSerialization.jsonObject(with: data)
        
        ref.child(type.key)
            .child(id)
            .setValue(jsonString)
    }
    
    enum FirebaseError: Error {
        case dataNotFound
        case invalidData
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
