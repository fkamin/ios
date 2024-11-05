import SwiftUI

struct CardView: View {
    
    let emoji: String
    
    @Binding var backgroundColor: Color
    @State var isVisible: Bool = false
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .stroke(.blue)
                    .background(Color(.white))
                    .font(.largeTitle)
                    .cornerRadius(12)
                Text(emoji)
                    .font(.system(size: 60))
                    
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

//#Preview {
//    CardView(emoji: "🇲🇰", backgroundColor: Binding<Color.white>, isVisible: false)
//}
