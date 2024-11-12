import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    var cardColor: Color
    
    @State var isVisible: Bool = true
    
    var body: some View {
        let backgroundColor = isVisible ? Color.white : cardColor
        
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .stroke(.blue)
                    .background(Color(.white))
                    .font(.largeTitle)
                    .cornerRadius(12)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
                    
            }.opacity(isVisible ? 1.0 : 0.0)
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(backgroundColor, lineWidth: 2)
                    .font(.largeTitle)
                    .background(backgroundColor)
                    .cornerRadius(12)
            }
            .opacity(!isVisible ? 1.0 : 0.0)
        }.onTapGesture(perform: {
            isVisible.toggle()
        });
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoGameModel<String>.Card(id: "1", content: "asd"), cardColor: Color.red)
    }
}
