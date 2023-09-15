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
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
            Text(card.content)
                .font(.system(size:Constants.FontSize.largest))
                .minimumScaleFactor(Constants.FontSize.scaleFactor)
                .multilineTextAlignment(.center)
                .aspectRatio(1, contentMode: .fit)
                .padding(Constants.Pie.inset)
                
            )
            .padding(Constants.inset)
            .cardify(isFacedup: card.isFacedUp)
            .opacity(card.isFacedUp || !card.isMatched ? 1 : 0)
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



struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    static var previews: some View {
        CardView(Card(content: "Hello", id: "test"))
            .padding()
            .foregroundColor(.blue)
    }
}
