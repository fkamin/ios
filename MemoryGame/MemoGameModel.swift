import Foundation

struct MemoGameModel<CardContent: Equatable> {
    private(set) var mainCard: Card? = nil
    private(set) var cards: Array<Card>
    private(set) var score = 0
    
    init(numberOfCards: Int, cardContentFactory: (Int)-> CardContent) {
        cards = []
        let cardNumber = Int.random(in: 0..<numberOfCards)
        for i in 0 ..< numberOfCards{
            let content = cardContentFactory(i)
            self.cards.append(Card(id: String("\(i)a"), content: content))
            
            if (cardNumber == i){
                self.mainCard = Card(id: String("\(i)b"), content: content)
            }
        }
    }
    
    func selectCard(card: Card) {
        cards.randomElement()
    }
    
    func index (card: Card) -> Int?{
        return cards.firstIndex(where: { $0.id == card.id })
    }
    
    func indexOfFacedUpCard(excluding card: Card) -> [Int] {
        return cards.enumerated().compactMap { (index, currentCard) in
            (currentCard.isVisible && !currentCard.foundMatch && currentCard.id != card.id) ? index : nil
        }
    }
    
    mutating func changeVisible() {
        for index in 0..<cards.count {
            if !cards[index].foundMatch {
                cards[index].isVisible = false
            }
        }
    }
    
    func getNumberCard(from card: Card) -> String {
        return String(card.id.dropLast())
    }
    
    mutating func choose(card: Card) {
            if let mainCard = mainCard {
                let currentCardNumber = getNumberCard(from: card)
                let mainCardNumber = getNumberCard(from: mainCard)
                
                if currentCardNumber == mainCardNumber {
                    if let cardIndex = index(card: card) {
                        cards[cardIndex].foundMatch = true
                        self.mainCard?.foundMatch = true
                    }
                    changeVisible()
                    score += 10
                }
                score -= 1
            }
        }
    
    mutating func shuffleCard() {
        self.cards = cards.shuffled()
    }
    
    struct Card: Equatable, Identifiable {
        var id: String
        var isVisible: Bool = true
        var foundMatch: Bool = false
        var content: CardContent
    }
}
