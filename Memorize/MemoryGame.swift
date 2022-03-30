//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 25/02/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheonAndOnlyFaceUpCard: Int? {
        get{cards.indices.filter{ cards[$0].isFaceUp }.oneAndOnly }
        set{cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card:Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheonAndOnlyFaceUpCard{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
            indexOfTheonAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }else {
            return nil
        }
    }
}
