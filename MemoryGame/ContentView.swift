import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel = MemoGameViewModel()
    let cols = [
        GridItem(.adaptive(minimum: 85))
    ]
    
    func mainCardView() -> some View {
        if let mainCard = viewModel.getMainCard() {
            return AnyView(
                CardView(card: mainCard, cardColor: viewModel.themeColor, isFaceUp: true, viewModel: viewModel)
            )
        } else {
            return AnyView(Text("No main card"))
        }
    }
    
    var menu: some View {
        HStack {
            Button(action: {
                viewModel.changeTheme(number: 1)
            }) {
                VStack {
                    Text("😀")
                        .font(.title)
                    Text("Happy")
                        .font(.caption)
                }
            }
            .padding()
            
            Button(action: {
                viewModel.changeTheme(number: 2)
            }) {
                VStack {
                    Text("🐶")
                        .font(.title)
                    Text("Animals")
                        .font(.caption)
                }
            }
            .padding()
            
            Button(action: {
                viewModel.changeTheme(number: 3)
            }) {
                VStack {
                    Text("🍎")
                        .font(.title)
                    Text("Food")
                        .font(.caption)
                }
            }
            .padding()
        }
    }

    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)

            mainCardView()
                .padding()

            menu

            LazyVGrid(columns: cols, spacing: 0) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, cardColor: viewModel.themeColor, viewModel: viewModel)
                        .padding(5)
                        .opacity(card.isVisible ? 1 : 0)
                }
                
                
            }

            Button(action: {
                viewModel.shuffleCard()
            }) {
                Text("Shuffle Cards")
                    .font(.headline)
                    .padding()
                    .background(viewModel.themeColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .padding()
        .background(viewModel.themeColor.opacity(0.2))
    }
}


#Preview {
    ContentView()
}
