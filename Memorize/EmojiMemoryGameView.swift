//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
// 

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModel : EmojiMemoryGame
    private let aspectRatioOfCards : CGFloat = 2/3

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
                cards
                    .animation(.default, value: viewModel.cards)
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
        return AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatioOfCards){ card in
                CardView(card)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        .foregroundColor(viewModel.themeColor)
            
        }
        
    
    
}
    

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame(Themes()))
    }
}

