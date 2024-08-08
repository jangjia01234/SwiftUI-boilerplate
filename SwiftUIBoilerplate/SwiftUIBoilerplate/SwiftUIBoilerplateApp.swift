
import SwiftUI

@main
struct SwiftUIBoilerplateApp: App {
    @AppStorage("userID") var userID: String = ""
    @State private var navigateToContentView = false
    
    var body: some Scene {
        WindowGroup {
            if userID.isEmpty {
                OnboardingView(navigateToContentView: $navigateToContentView)
            } else {
                ContentView()
            }
        }
    }
    
}
