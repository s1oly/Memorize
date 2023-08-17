//
//  MemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    func choose( _ card : Card) {
        
    }
    
    init(numPairsofCards: Int , createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numPairsofCards{
            let content = createCardContent(pairIndex)
            cards.append(Card( content: <#T##CardContent#>))
            cards.append(Card( content: <#T##CardContent#>))

        }
    }
    
    struct Card{
        var isFacedUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
    }
}
