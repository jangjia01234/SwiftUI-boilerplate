//
//  PiPiApp.swift
//  PiPi
//
//  Created by 정상윤 on 7/29/24.
//

import SwiftUI

@main
struct PiPiApp: App {
    @State var isShowingSheet: Bool = false
    
    var body: some Scene {
        WindowGroup {
//            OnboardingTabView()
            TicketsView(isShowingSheet: $isShowingSheet)
        }
    }
}
