//
//  ActivityInformationSectionView.swift
//  PiPi
//
//  Created by 정상윤 on 8/8/24.
//

import SwiftUI

struct ActivityInformationSectionView: View {
    
    let startDateTime: Date
    let estimatedTime: Int?
    let maxPeopleNumber: Int
    let category: Activity.Category
    
    @Binding var showLocationView: Bool
    
    var body: some View {
        Section {
            informationRow(label: "시작 일시", data: startDateTime.toString())
            informationRow(label: "예상 소요시간", data: (estimatedTime == nil) ? "미정" : "\(estimatedTime!)시간")
            informationRow(label: "최대인원", data: "\(maxPeopleNumber)")
            informationRow(label: "카테고리", data: category.rawValue)
            HStack {
                Text("위치")
                    .frame(width: 120, alignment: .leading)
                Button("지도보기") {
                    showLocationView = true
                }
            }
        }
        .listRowBackground(Color(.secondarySystemBackground))
    }
    
    private func informationRow(label: String, data: String) -> some View {
        HStack {
            Text(label)
                .frame(width: 120, alignment: .leading)
            Text(data)
        }
    }
    
}
