//
//  ContentView.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "map")
                    Text("홈")
                }
            
            // TODO: TicketsView 추가
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("프로필")
                }
        }
        .tint(.accent)
    }
    
}

struct SplashView: View {
    
    @State private var opacity = 1.0
    
    var body: some View {
        VStack {
            Image("splash")
                .resizable()
                .ignoresSafeArea()
                .opacity(opacity)
        }
        .onAppear {
            // ContentView가 나타난 후 3초 후에 opacity를 0으로 변경하여 투명해지도록 함
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    opacity = 0.0
                }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
