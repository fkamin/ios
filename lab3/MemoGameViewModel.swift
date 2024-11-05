import Foundation

class MemoGameViewModel {
    var currentEmojis: [String] = []
    var themeNumber: Int = 1
    
    static let firstEmojisTheme = ["😀", "😃", "😄", "😁"]
    static let secondEmojisTheme = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐"]
    static let thirdEmojisTheme = ["🇨🇱", "🇧🇫", "🇨🇮", "🇹🇩", "🇮🇪", "🇰🇿", "🇨🇲", "🇯🇴"]
    
    var model = generateMemoGameModel()
    
    static func generateMemoGameModel() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfCards: firstEmojisTheme.count) {
            index in if firstEmojisTheme.indices.contains(index) {
                firstEmojisTheme[index]
            } else {
                "??"
            }
        }
    }
    
    static func changeTheme() {
        
    }
}
