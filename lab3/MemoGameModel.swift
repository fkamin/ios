import Foundation

struct MemoGameModel<CardContent: Equatable> {
    private var mainCard: Card? = nil
    private var cards: Array<Card>
    
    init (numberOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array()
        let cardNumber = Int.random(in: 0..<numberOfCards)
        for i in 0..<numberOfCards {
            let content = cardContentFactory(i)
            cards.append(Card(id: "\(i)a", content: content))
            
            if (cardNumber == i) {
                self.mainCard = Card(id: "\(i)b", content: content)
            }
        }
    }
    
    func selectCard(card: Card) {
        
    }
    
    mutating func shuffleCards() {
        cards.shuffled()
    }
    
    struct Card: Equatable, Identifiable {
        var id: String
        var isUp: Bool = true
        var isMatching: Bool = false
        var content: CardContent
    }
}
