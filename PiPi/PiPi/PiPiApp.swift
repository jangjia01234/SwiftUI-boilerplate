//
//  PiPiApp.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import SwiftUI

@main
struct PiPiApp: App {
    @State var isSheetPresented = false
    
    var body: some Scene {
        WindowGroup {
//            OnboardingTabView()
            TicketsView(isShowingSheet: $isSheetPresented)
                .onOpenURL { url in
                    if url == URL(string: "pipi://auth") {
                        isSheetPresented = true
                    }
                }
        }
    }
}
