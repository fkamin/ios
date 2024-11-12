import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MemoGameViewModel()
    let cols = [
        GridItem(.adaptive(minimum: 85))
    ]
    
    func mainCardView() -> some View {
        if let mainCard = viewModel.getMainCard() {
            return AnyView(
                CardView(card: mainCard, cardColor: viewModel.themeColor)
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
                    CardView(card: card, cardColor: viewModel.themeColor)
                        .padding(5)
                }
            }

            Button(action: {
                viewModel.shuffleEmojis()
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
