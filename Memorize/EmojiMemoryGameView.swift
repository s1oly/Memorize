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
    private let dealAnimation : Animation = .easeInOut(duration: 2)
    private let dealInterval : TimeInterval = 0.15
    private let deckWidth : CGFloat = 50

    var body: some View{
        VStack{
            HStack{
                Text(viewModel.themeName)
                    .font(.largeTitle)
            }
            Spacer()
            cards.foregroundColor(viewModel.themeColor)
            HStack(spacing: 20){
                Button("New Game"){
                    withAnimation{
                        viewModel.newGame(Themes())
                    }
                }
                .font(.title3)
                Spacer()
                deck.foregroundColor(viewModel.themeColor)
                Spacer()
                score
            }
            
        }
        .padding()
    }
    
    private var cards : some View {
       AspectVGrid(viewModel.cards, aspectRatio: aspectRatioOfCards){ card in
            if isDealt(card){
                view(for:card)
                    .padding(4)
                    .overlay(FlyingNumber(number : scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        choose(card)
                    }
            }
        }
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
    
    private func view(for card: Card ) -> some View{
        CardView(card)
            .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            .transition(.asymmetric(insertion: .identity, removal: .identity))
    }
    
    // MARK: - Dealing from a Deck
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                view(for: card)
            }
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatioOfCards)
        .onTapGesture {
            deal()
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 0.75
        for card in viewModel.cards {
            withAnimation(dealAnimation.delay(delay)) {
                _ = dealt.insert(card.id)
            }
            delay += dealInterval
        }
    }
}

    

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
       EmojiMemoryGameView(viewModel: EmojiMemoryGame(Themes()))
    }
}

