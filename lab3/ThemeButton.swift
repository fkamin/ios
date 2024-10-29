import SwiftUI

struct ThemeButton: View {
    
    @State var buttonLabel: String
    @State var buttonImageName: String

    @Binding var themeNumber: Int
    var ownNumber: Int = 0
    
    @Binding var themeColor: Color
    var ownColor: Color
    
    var body: some View {
        Button(action: {
            themeNumber = ownNumber
            themeColor = ownColor
        }, label: {
            VStack{
                Image(systemName: buttonImageName).imageScale(.large)
                Text(buttonLabel)
            }
        }).foregroundStyle(themeColor)
    }
}
