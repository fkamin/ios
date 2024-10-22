import SwiftUI

struct ContentView: View {
    @State private var numberOfCards: Int = 2
    @State private var currentCards: [String] = ["😀", "😃"]
    let cardContents: [String] = ["😀", "😃", "😄", "😁", "😆", "🥹"]
    let cols = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    
    var body: some View {
        LazyVGrid(columns: cols) {
            
            ForEach(currentCards, id: \.self) { item in
                CardView(emoji: item)
                    .padding()
            }
        }
        cardAdd
        cardDel
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            numberOfCards += offset
            currentCards.append(cardContents[numberOfCards-2])
            currentCards.append(cardContents[numberOfCards-1])
        }) {
            Image(systemName: symbol)
                .resizable()
                .frame(width: 50, height: 50)
        }
        .disabled((numberOfCards >= 2 && numberOfCards < cu))
            
    }

    
    var cardAdd: some View {
        return adjustCardNumber(by: 2, symbol: "plus.circle.fill")
    }
    
    var cardDel: some View {
        return adjustCardNumber(by: -2, symbol: "minus.circle.fill")
    }
}

#Preview {
    ContentView()
}

