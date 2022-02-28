/*//
 //  ContentView.swift
 //  Memorize
 //
 //  Created by Yuri Cavalcante on 07/02/22.
 //

 import SwiftUI

 struct ContentView: View {
     @State var emojiCount = 4
     var emojis = ["🚗","🚙","🛺","🛵","✈️","🚀","🚘","🚞","🚇","🛴","🚒","🏎","🦼"]
     var body: some View {
         VStack{
             ScrollView{
                 LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 150))], content: {
                     ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                         CardView(emoji: emoji).aspectRatio(2/3, contentMode: .fit)
                     }
                 })
             }
             Spacer()
             HStack{
                 remove
                 Spacer()
                 add
             }
             .font(.largeTitle)
             .padding(.horizontal)
         }
         .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
         
     }
     var remove: some View{
         Button(action: {
             if emojiCount > 1{
                 emojiCount -= 1
             }
         }, label: {
             Image(systemName: "minus.circle")
         })
     }
     
     var add: some View{
         Button(action: {
             if emojiCount < emojis.count{
                 emojiCount += 1
             }
         }, label: {
            Image(systemName: "plus.circle")
         })
     }
     
 }

 struct CardView: View {
     @State var isFacedUp: Bool = false
     var emoji: String
     var body: some View {
             ZStack {
                 let cardFace = RoundedRectangle(cornerRadius: 20)
                 if isFacedUp{
                     cardFace.fill().foregroundColor(.white)
                     Text(emoji)
                         .font(.largeTitle)
                 }
                 else{
                     cardFace.fill()
                 }
                 
             }
             .onTapGesture {
                 isFacedUp = !isFacedUp
             }
                 .padding()
                 .foregroundColor(.red)
     }
 }


 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
             .preferredColorScheme(.dark)
 .previewInterfaceOrientation(.portraitUpsideDown)
         ContentView()
             .preferredColorScheme(.light)
     }
 }

*/
