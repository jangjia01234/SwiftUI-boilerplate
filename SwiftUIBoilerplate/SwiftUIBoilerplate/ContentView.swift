
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            SampleView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Sample")
                }
        }
        .tint(.accent)
    }
}

#Preview {
    ContentView()
}
