import SwiftUI
import CoreGraphics

struct CardView: View {
    var card: MemoGameModel<String>.Card
    var cardColor: Color
    @State var isFaceUp: Bool = false
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        //let backgroundColor = isFaceUp ? Color.white : cardColor
        
        CirclePart(endAngle: .degrees(240))
            .overlay(
                Text(card.content)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.01)
                    .font(.system(size: 200))
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(.degrees(card.foundMatch ? 360 : 0))
                    .animation(.spin(duration: 2), value: card.foundMatch)
            )
            .modifier(TransformIntoCard(isFacedUp: isFaceUp))
            .opacity(card.isVisible ? 1 : 0)
            .foregroundColor(Color.blue)
            .frame(width: 100, height: 150)
            .onTapGesture {
                withAnimation {
                    isFaceUp.toggle()
                    viewModel.chooseCard(card: card)
                }
            }
        
        //let backgroundColor = isFaceUp ? Color.white : cardColor
        
//        ZStack {
//            RoundedRectangle(cornerRadius: 12)
//                .stroke(lineWidth: 2)
//                .foregroundColor(cardColor)
//                .background(backgroundColor)
//                .cornerRadius(12)
//                .opacity(isFaceUp ? 1 : 0.5)
//                .aspectRatio(2/3, contentMode: .fit)
//                .onTapGesture {
//                    withAnimation {
//                        isFaceUp.toggle()
//                        
//                        viewModel.chooseCard(card: card)
//                    }
//                }
//
//            if isFaceUp {
//                Text(card.content)
//                    .font(.system(size: 200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(contentMode: .fit)
//            }
//        }
//        .frame(width: 100, height: 150)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
