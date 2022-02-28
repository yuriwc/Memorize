//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 25/02/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    static let emojis = ["🍎","🍊","🍑","🍉"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairCards: 4, createCardContent: { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        })
    }
        
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
