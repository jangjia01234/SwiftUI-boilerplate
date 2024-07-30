//
//  HomeView.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    var body: some View {
        ZStack {
            VStack {
                CategoryFilterView()
                Spacer()
            }
            .padding(.horizontal)
            .zIndex(2)
            
            Map {
                
            }
            .zIndex(1)
        }
    }
    
}

#Preview {
    HomeView()
}
