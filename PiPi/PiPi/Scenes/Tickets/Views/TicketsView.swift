//
//  TicketsView.swift
//  PiPi
//
//  Created by Jia Jang on 7/31/24.
//

import SwiftUI

enum tabInfo : String, CaseIterable {
    case participant = "참가자"
    case organizer = "주최자"
}

struct TicketsView: View {
    @State private var selectedPicker: tabInfo = .participant
    @State private var isShowingModal: Bool = false
    
    var body: some View {
        NavigationStack {
            TabBar(selectedPicker: $selectedPicker)
            TicketView(selectedPicker: $selectedPicker)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TicketsView()
}
