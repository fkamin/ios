

import SwiftUI

struct ContentView: View {
    var emojis  = ["🇵🇸","🇮🇱", "🇯🇴", "🇺🇸", "🇸🇾"]
    var emojis2 = ["🐦","🐶", "🐱", "🐭", "🐸", "🐮", "🐷"]
    var emojis3 = ["🚗","🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚜"]
    
    
    
    @State
    var cardCount: Int = 7
    @State var opacity: Double = 1;
    
    @State var currentThemeNumber: Int = 0
    @State var currentBackgroundColor: Color = .red
    
    var body: some View {
        VStack {
            Text("Memo")
                .fontWeight(.bold)
                .padding()
            ScrollView{
                items
            }
            
            buttons
            
//            HStack(){
//                Button("+"){
//                    adjustCardNumber(by: 2, symbol: "+")
//                }.frame(minWidth: 150, minHeight: 50)
//                    .opacity(opacity)
//                Spacer()
//                Button("-"){
//                    adjustCardNumber(by: 2, symbol: "-")
//                }.frame(minWidth: 150, minHeight: 50)
//                    .opacity(opacity)
//            }
        }
        .padding()
        
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> Void{
        if(cardCount > 10 || cardCount < 2){
            return;
        }
        cardCount = symbol == "-" ? cardCount - 2 : cardCount + 2
    }
    
    func GetEmojisArray() -> Array<String>{
        
        if(currentThemeNumber == 0){
            return emojis.shuffled();
        }
        else if(currentThemeNumber == 1){
            return emojis2.shuffled()
        }
        return emojis3.shuffled();
    }
    
    
    var items: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            let emojisArray = GetEmojisArray()
            
            ForEach(0..<emojisArray.count, id: \.self){
                i in
                CardView(emoji: emojisArray[i],
                         backgroundColor: $currentBackgroundColor)
                    .aspectRatio(2/3, contentMode: .fit)
                
                //metoda pobierajaca dobry array
            }
        }
    }
    
    var buttons: some View {
        HStack(alignment: .center){
            ThemeButton(buttonLabel: "Motyw 1", buttonImageName: "pencil",
                        themeNumber: $currentThemeNumber,
                        ownNumber: 0,
                        themeColor: $currentBackgroundColor,
                        ownColor: .red
                        
            )
            Spacer()
            ThemeButton(buttonLabel: "Motyw 2", buttonImageName: "eraser",
                        themeNumber: $currentThemeNumber,
                        ownNumber: 1,
                        themeColor: $currentBackgroundColor,
            ownColor: .blue)
            Spacer()
            ThemeButton(buttonLabel: "Motyw 3", buttonImageName: "square.and.arrow.down.on.square",
                        themeNumber: $currentThemeNumber,
                        ownNumber: 2,
                        themeColor: $currentBackgroundColor,
                ownColor: .black)
        
        }
    }
    
    
}

//#Preview {
//    ContentView()
//}
