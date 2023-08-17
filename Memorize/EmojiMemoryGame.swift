//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import SwiftUI




class EmojiMemoryGame{
    
    static let emojis = ["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️","🚤","🚁","🛶","🚠"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numPairsofCards: 5) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model : MemoryGame<String> = createMemoryGame()
  
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
