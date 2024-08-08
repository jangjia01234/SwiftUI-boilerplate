
import SwiftUI

struct OnboardingView: View {
    @AppStorage("userID") var userID: String = ""
    @Binding var navigateToContentView: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Onboarding View")
                    .font(.largeTitle)
                
                Button {
                    userID = UUID().uuidString
                } label: {
                    Text("Generate ID")
                }
                .buttonStyle(.borderedProminent)
                .tint(.accent)
            }
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
        }
    }
}
