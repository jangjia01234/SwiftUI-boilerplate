
import SwiftUI

struct HomeView: View {
    @AppStorage("userID") var userID: String = ""
    
    var body: some View {
        VStack {
            Text("Home View")
                .font(.largeTitle)
            
            Text("User ID: \n\(userID)")
                .padding()
            
            Button {
                // MARK: userID 삭제
                userID = ""
            } label: {
                Text("Delete User ID")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    HomeView()
}
