//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import SwiftUI




class EmojiMemoryGame : ObservableObject {
    
    private static let emojis = ["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
       return MemoryGame(numofPairsofCards: 12){ pairIndex in
           if emojis.indices.contains(pairIndex){
               return emojis[pairIndex]
           }
           else{
               return "⁉️"
           }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
