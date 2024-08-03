//
//  TicketDetailView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI
import FirebaseDatabase

struct TicketDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ActivityViewModel()
    @Binding var isParticipantList: Bool
    @Binding var isLocationVisible: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                // TODO: 데이터 연결 예정 (현재 목업 데이터로 구성)
                if let activity = viewModel.activity {
                    if isParticipantList {
                        Form {
                            Text("참가자 1")
                            Text("참가자 2")
                            Text("참가자 3")
                            Text("참가자 4")
                        }
                    } else if isLocationVisible {
                        Text("Location: \(activity.coordinates)")
                    } else {
                        Text("Host ID: \(activity.hostID)")
                    }
                }
            }
            .navigationBarTitle("리스트", displayMode: .inline)
            .navigationBarItems(trailing: Button("완료", action: {
                dismiss()
            }))
        }
        .foregroundColor(.black)
    }
}

#Preview {
    TicketDetailView(isParticipantList: .constant(false), isLocationVisible: .constant(false))
}
