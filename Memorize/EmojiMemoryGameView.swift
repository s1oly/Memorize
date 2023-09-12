//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
// 

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel : EmojiMemoryGame
    private let aspectRatio : CGFloat = 2/3

    var body: some View{
        VStack{
            HStack{
                Text(viewModel.themeName)
                    .font(.largeTitle)
            }
            HStack(spacing: 20){
                Text("Score")
                    .font(.title3)
                Text(String(viewModel.gameScore))
            }
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack{
                Button("New Game"){
                    viewModel.newGame(Themes())
                }
                .font(.title3)
            }
            
        }
        .padding()
    }
    
    private var cards : some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing:0){
            ForEach(viewModel.cards) {card in
                CardView(card)
                    .aspectRatio(aspectRatio,contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.themeColor)
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
            .opacity(card.isFacedUp || !card.isMatched ? 1 : 0)
        }
    }
        
    


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame(Themes()))
    }
}

