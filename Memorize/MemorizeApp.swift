//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 07/02/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private  let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
