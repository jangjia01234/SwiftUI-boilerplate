//
//  PeopleListView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

struct PeopleListView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isParticipantList: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: 데이터 연결 예정 (현재 목업 데이터로 구성)
                if isParticipantList {
                    Form {
                        Text("참가자 1")
                        Text("참가자 2")
                        Text("참가자 3")
                        Text("참가자 4")
                    }
                } else {
                    Text("주최자 프로필")
                }
            }
            .navigationBarTitle("리스트", displayMode: .inline)
            .navigationBarItems(trailing: Button("완료", action: { dismiss() }))
        }
    }
}

#Preview {
    PeopleListView(isParticipantList: .constant(false))
}
