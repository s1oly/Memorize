//
//  MemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numofPairsofCards: Int , cardContentFactory: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<max(2,numofPairsofCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content))
            cards.append(Card( content: content))

        }
    }
    
    func choose( _ card : Card) {
    
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    
    struct Card {
        var isFacedUp : Bool = true
        var isMatched : Bool = false
        var content : CardContent
       
    }
}
