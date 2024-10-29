import SwiftUI

struct ThemeButton: View {
    
    //zmiana theme - kolor
    //pobieranie arraya w zaleznosci od wartosci inta w cardview
    @State var buttonLabel: String
    @State var buttonImageName: String

    //contentView
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
        })
    }
}

//#Preview {
//    ThemeButton()
//}
