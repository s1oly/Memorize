//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel : EmojiMemoryGame

    var body: some View{
        VStack{
            ScrollView{
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing:0){
            ForEach(viewModel.cards.indices , id : \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.blue)
    }

}
    
    







struct CardView: View{
    var card : MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
            ZStack{
                let base = RoundedRectangle(cornerRadius: 20)
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth:2)
                    Text(card.content)
                        .font(.system(size:200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                    .opacity(card.isFacedUp ? 1 : 0)
                base.fill()
                    .opacity(card.isFacedUp ? 0 : 1)
                
            }
        }
    }




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

