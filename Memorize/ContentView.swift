//
//  ContentView.swift
//  Memorize
//
//  Created by Yuri Cavalcante on 07/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
   
    var body: some View {
        VStack{
            Text("Memorize")
                .font(.title)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 150))], content: {
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                })
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}
struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(Color.red)
            }else if card.isMatched{
                shape.opacity(0)
            } else{
                shape.fill()
            }
        }
        .foregroundColor(.red)
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

