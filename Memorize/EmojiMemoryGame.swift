//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 25/02/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🍎","🍊","🍑","🍉"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairCards: 4, createCardContent: { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        })
    }
        
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card){
        model.choose(card)
    }
    
}
