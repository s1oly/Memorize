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
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        choose(card)
                    }
            }
        .foregroundColor(viewModel.themeColor)
            
        }
    
    @State private var lastScoreChange = (0, causedbyCardID : "")
    
    private func scoreChange(causedBy card : Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    private func choose(_ card : Card){
        withAnimation(.easeInOut(duration: 0.5)){
            let scoreBefore = viewModel.gameScore
            viewModel.choose(card)
            let scoreChange = viewModel.gameScore - scoreBefore
            lastScoreChange = (scoreChange, causedbyCardID: card.id)
        }
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

