//
//  Date+.swift
//  PiPi
//
//  Created by Jia Jang on 8/5/24.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy/MM/dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
