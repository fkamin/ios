import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    var cardColor: Color
    @State var isFaceUp: Bool = false
    @ObservedObject var viewModel: MemoGameViewModel
    
    var body: some View {
        let backgroundColor = isFaceUp ? Color.white : cardColor
        
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .foregroundColor(cardColor)
                .background(backgroundColor)
                .cornerRadius(12)
                .opacity(isFaceUp ? 1 : 0.5)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    withAnimation {
                        isFaceUp.toggle()
                        
                        viewModel.chooseCard(card: card)
                    }
                }

            if isFaceUp {
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: 100, height: 150)
    }
}
