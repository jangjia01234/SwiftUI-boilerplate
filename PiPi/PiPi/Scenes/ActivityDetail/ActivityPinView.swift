//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI

struct ActivityPinView: View {
    @State private var ActivityPin = false
    @Binding var nickname: String
    
    var body: some View {
        Text("맵")
        
        Button("활동핀"){
            ActivityPin = true
        }
        .sheet(isPresented: $ActivityPin) {
            ActivityDetailView(id: .constant("C6D5689C-ABB7-4D81-99C8-ACBEA9D2E513"))
                .background(Color(.white))
                .presentationDetents([.height(150), .height(650)])
                .presentationCornerRadius(21)
                .presentationDragIndicator(.visible)
        }
    }
}


#Preview {
    ActivityPinView(nickname: .constant("역적"))
}
