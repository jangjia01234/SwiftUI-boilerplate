//
//  TicketsView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

enum TicketType : String, CaseIterable {
    case participant = "참가자"
    case organizer = "주최자"
}

struct TicketsView: View {
    @State private var selectedItem: TicketType = .participant
    @State private var isShowingModal: Bool = false
    @State private var isAuthenticated: Bool = false
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        NavigationStack {
            TicketSegmentedControl(selectedItem: $selectedItem)
            
            ScrollView {
                TicketView(selectedItem: $selectedItem, isShowingSheet: $isShowingSheet, isAuthDone: $isAuthenticated)
            }
            .scrollBounceBehavior(.basedOnSize)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isShowingSheet) {
            QRAuthView(isShowingAuth: $isShowingSheet, isAuthDone: $isAuthenticated)
        }
    }
}

#Preview {
    TicketsView(isShowingSheet: .constant(false))
}
