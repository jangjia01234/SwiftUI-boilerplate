//
//  HomeView.swift
//  PiPi
//
//  Created by 정상윤 on 7/30/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @Namespace private var mapScope
    
    var body: some View {
        ZStack {
            Map {
                
            }
        }
    }
    
}

#Preview {
    HomeView()
}
