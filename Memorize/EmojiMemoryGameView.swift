//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
// 

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel : EmojiMemoryGame
    private let aspectRatioOfCards : CGFloat = 2/3
    

    var body: some View{
        VStack{
            HStack{
                Text(viewModel.themeName)
                    .font(.largeTitle)
            }
            Spacer()
            cards
            HStack(spacing: 20){
                Button("New Game"){
                    withAnimation{
                        viewModel.newGame(Themes())
                    }
                }
                .font(.title3)
                score
            }
            
        }
        .padding()
    }
    
    private var cards : some View {
        return AspectVGrid(items: viewModel.cards, aspectRatio: aspectRatioOfCards){ card in
                CardView(card)
                    .padding(4)
                    .overlay(FlyingNumber(number : scoreChange(causedBy: card)))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            viewModel.choose(card)
                        }
                    }
            }
        .foregroundColor(viewModel.themeColor)
            
        }
    
    private func scoreChange(causedBy card : Card) -> Int {
        return 0
    }
    
    private var score : some View {
        Text("Score: \(viewModel.gameScore)")
            .font(.title3)
            .animation(nil)
    }

    
    
}
    

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame(Themes()))
    }
}

