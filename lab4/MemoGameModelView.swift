import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static var currentEmojis: [String] = firstEmojisTheme
    private var themeNumber: Int = 1
    private (set) var themeColor: Color = Color.red
    
    private static let firstEmojisTheme = ["😀", "😃", "😄", "😁"]
    private static let secondEmojisTheme = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐"]
    private static let thirdEmojisTheme = ["🇨🇱", "🇧🇫", "🇨🇮", "🇹🇩", "🇮🇪", "🇰🇿", "🇨🇲", "🇯🇴"]
    
    @Published
    private var model = generateMemoGameModel()
    
    private static func generateMemoGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfCards: currentEmojis.count) {
            index in if currentEmojis.indices.contains(index) {
                currentEmojis[index]
            } else {
                "??"
            }
        }
    }
    
    func changeTheme(number: Int) {
        themeNumber = number
        
        if (number == 1) {
            themeColor = Color.red
            MemoGameViewModel.currentEmojis = MemoGameViewModel.firstEmojisTheme
        } else if (number == 2) {
            themeColor = Color.blue
            MemoGameViewModel.currentEmojis = MemoGameViewModel.secondEmojisTheme
        } else if (number == 3) {
            themeColor = Color.green
            MemoGameViewModel.currentEmojis = MemoGameViewModel.thirdEmojisTheme
        }
        
        model = MemoGameViewModel.generateMemoGameModel()
    }
    
    func shuffleEmojis() {
        model.shuffleCards()
    }
    
    func getMainCard() -> MemoGameModel<String>.Card? {
        return model.mainCard
    }
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
}
