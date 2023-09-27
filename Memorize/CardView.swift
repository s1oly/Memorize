//
//  CardView.swift
//  Memorize
//
//  Created by S1OLY on 9/14/23.
//

import SwiftUI

struct CardView: View{
    
    typealias Card = MemoryGame<String>.Card
    var card : Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View{
        TimelineView(.animation){ timeline in
            if card.isFacedUp || !card.isMatched{
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360 - 120))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContent.padding(Constants.Pie.inset))
                    .cardify(isFacedup: card.isFacedUp)
                    .transition(.scale)
            }
            else{
                Color.clear
            }
        }
        
    }
    
    var cardContent : some View{
        Text(card.content)
            .font(.system(size:Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .padding(Constants.Pie.inset)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration : 1), value: card.isMatched)
    }
    
    private struct Constants{
        static let CornerRadius:CGFloat = 12
        static let lineWidth:CGFloat = 2
        static let inset:CGFloat = 5
        struct FontSize{
            static let largest: CGFloat = 200
            static let smallest:CGFloat = 10
            static let scaleFactor = smallest/largest
        }
        struct Pie{
            static let opacity : CGFloat = 0.5
            static let inset : CGFloat = 5
        }
    }
    
    
}

extension Animation {
    static func spin(duration : TimeInterval) -> Animation{
        .linear(duration: 1)
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    static var previews: some View {
        CardView(Card(content: "Hello", id: "test"))
            .padding()
            .foregroundColor(.blue)
        
    }
}
