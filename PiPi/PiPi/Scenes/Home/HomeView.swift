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
            Map(scope: mapScope) {
                
            }
            .mapControlVisibility(.hidden)
            .zIndex(1)
            
            ZStack {
                VStack {
                    CategoryFilterView()
                    TicketProfileButtonView()
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Spacer()
                        VStack(spacing: 5) {
                            Button(action: {
                                // TODO: 새로고침 동작 구현
                            }) {
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .aspectRatio(contentMode: .fit)
                            }
                            .setSmallButtonAppearance()
                            MapUserLocationButton(scope: mapScope)
                                .setSmallButtonAppearance()
                        }
                        ActivityCreateButton()
                    }
                }
            }
            .padding(.horizontal)
            .zIndex(2)
        }
        .mapScope(mapScope)
    }
    
}

fileprivate extension View {
    
    func setSmallButtonAppearance() -> some View {
        self
            .frame(width: 38, height: 38)
            .background(.white)
            .clipShape(Circle())
            .setShadow()
    }
    
}

#Preview {
    HomeView()
}
