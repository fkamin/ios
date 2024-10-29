import SwiftUI

struct CardView: View {
    
    let emoji : String
    
    @Binding var backgroundColor: Color
    @State var isVisible: Bool = true
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                    .stroke(.blue)
                    .background(Color(.white))
                    .font(.largeTitle)
                Text(emoji)
                    .font(.system(size: 60))
                    
            }.opacity(isVisible ? 1.0 : 0.0)
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(backgroundColor, lineWidth: 2)
                    .font(.largeTitle)
                    .background(backgroundColor)
            }
            .opacity(!isVisible ? 1.0 : 0.0)
        }.onTapGesture(perform: {
            isVisible.toggle()
        });
    }
}

//#Preview {
//    CardView(emoji: String, isVisible: Bool)
//}
