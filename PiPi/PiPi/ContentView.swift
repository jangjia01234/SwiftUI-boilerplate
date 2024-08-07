//
//  ContentView.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showHomeView = false
    
    var body: some View {
        VStack {
            if !showHomeView {
                SplashView()
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            withAnimation {
                                showHomeView = true
                            }
                        }
                    }
            } else {
                OnboardingTabView()
            }
        }
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
