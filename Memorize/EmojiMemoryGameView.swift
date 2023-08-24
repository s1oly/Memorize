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
            HStack{
                Text(viewModel.selectedTheme().Name)
                    .font(.title)
            }
            ScrollView{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            HStack{
                Button("New Game"){
                    viewModel.newGame()
                }
                .font(.title3)
                Spacer()
                Button("Shuffle"){
                    viewModel.shuffle()
                }
                .font(.title3)
            }
           
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing:0){
            ForEach(viewModel.cards) {card in
                CardView(card)
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(color)
    }
    
    var color : Color{
        switch viewModel.selectedTheme().Color{
        case "Red":
            return .red
        case "Blue":
            return .blue
        case "Green":
            return .green
        case "Yellow":
            return .yellow
        case "Orange":
            return .orange
        case "Purple":
            return .purple
        default:
            return .pink
        }
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
       EmojiMemoryGameView(viewModel: EmojiMemoryGame(Theme()))
    }
}

