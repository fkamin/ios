import Foundation
import SwiftUI

struct TransformIntoCard: ViewModifier {
    var isFacedUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.strokeBorder(lineWidth: 4)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFacedUp ? 1 : 0)
            base.fill()
                .opacity(isFacedUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(isFacedUp ? 0 : 180), axis: (0, 1, 0))
        .animation(.easeInOut(duration: 1), value: isFacedUp)
    }
}
