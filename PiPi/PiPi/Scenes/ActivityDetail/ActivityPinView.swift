//
//  ActivityDetailView.swift
//  PiPi
//
//  Created by Byeol Kim on 7/30/24.
//

import SwiftUI

struct ActivityPinView: View {
    @State private var ActivityPin = false
    
    var body: some View {
        Text("맵")
        
        
        Button("활동핀"){
        ActivityPin = true
        }
        .sheet(isPresented: $ActivityPin) {
            ActivityDetailView()
                .presentationDetents([.height(150), .height(650)])
                .presentationCornerRadius(21)
                .presentationDragIndicator(.visible)
        }
        }
    }


#Preview {
    ActivityPinView()
}
