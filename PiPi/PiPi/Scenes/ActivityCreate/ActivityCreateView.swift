//
//  ActivityCreateView.swift
//  PiPi
//
//  Created by 정상윤 on 7/31/24.
//

import SwiftUI

struct ActivityCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isFocused
    
    @State private var title = ""
    @State private var description = ""
    @State private var maxPeopleNumber = 1
    @State private var category: Activity.Category = .meal
    @State private var startDateTime = Date()
    @State private var estimatedTime: Int? = nil
    @State private var location: Coordinates? = nil
    
    var body: some View {
        NavigationStack {
            ActivityInformationFormView(
                title: $title,
                description: $description,
                maxPeopleNumber: $maxPeopleNumber,
                category: $category,
                startDateTime: $startDateTime,
                estimatedTime: $estimatedTime,
                location: $location
            )
            .padding(.top)
            .background(Color(.secondarySystemBackground))
            .navigationTitle("활동 등록")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("완료") {
                        isFocused = false
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("취소") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("완료") {
                        // TODO: 활동 등록 동작 구현
                    }
                }
            }
            }
        }
    }
    
}

#Preview {
    ActivityCreateView()
}
