//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI
import MessageUI

struct ActivityPinView: View {
    @State private var ActivityPin = false
    
    var body: some View {
        Text("맵")
        
        Button("활동핀"){
            ActivityPin = true
        }
        .sheet(isPresented: $ActivityPin) {
            ActivityDetailView()
                .background(Color(.white))
                .presentationDetents([.height(150), .height(650)])
                .presentationCornerRadius(21)
                .presentationDragIndicator(.visible)
        }
    }
}


#Preview {
    ActivityPinView()
}
