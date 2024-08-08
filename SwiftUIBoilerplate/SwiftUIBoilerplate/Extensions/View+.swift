
import SwiftUI

extension View {
    func setShadow() -> some View {
        self
            .shadow(
                color: .black.opacity(0.1),
                radius: 3,
                x: 0,
                y: 2
            )
    }
}
