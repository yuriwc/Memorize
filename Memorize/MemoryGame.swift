//
//  MemoryGame.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 25/02/22.
//

import Foundation

struct MemoryGame<CardContent>{
    
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card:Card){
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == of.id {
                return index
            }
        }
        return 0
    }
    init(numberOfPairCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
