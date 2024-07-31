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
    
    var body: some View {
        NavigationStack {
            TicketSegmentedControl(selectedItem: $selectedItem)
            TicketView(selectedItem: $selectedItem)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TicketsView()
}
