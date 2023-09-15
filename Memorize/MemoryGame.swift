//
//  MemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
// For assignment three, make use of CaseIterable aspect of Enum/Optional

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    private(set) var cards: Array<Card>
    
    private(set) var score : Int
    
    init(numofPairsofCards: Int , cardContentFactory: (Int) -> CardContent){
        score = 0
        cards = []
        for pairIndex in 0..<max(2,numofPairsofCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card( content: content, id: "\(pairIndex+1)a"))
            cards.append(Card( content: content, id: "\(pairIndex+1)b" ))

        }
    }
    
    var indexOfOneFacedUpCard : Int? {
        get{
            return cards.indices.filter{index in cards[index].isFacedUp}.only
        }
        set{
            return cards.indices.forEach{cards[$0].isFacedUp = (newValue == $0)}
        }
    }
    
    
    
    mutating func choose( _ card : Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if !cards[chosenIndex].isFacedUp && !cards[chosenIndex].isMatched{
                if let potentialMatchedIndex = indexOfOneFacedUpCard{
                    cards[potentialMatchedIndex].flipCount += 1
                    cards[chosenIndex].flipCount += 1
                    if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchedIndex].isMatched = true
                        score += 2
                    }
                    else{
                        if (cards[potentialMatchedIndex].flipCount>1 || cards[chosenIndex].flipCount>1){
                            score = score - 1
                        }
                    }
                }else{
                    indexOfOneFacedUpCard = chosenIndex
                }
                cards[chosenIndex].isFacedUp = true
            }
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func reset(){
        for i in 0..<cards.count{
            cards[i].isFacedUp = false
            cards[i].isMatched = false
        }
    }
    
 
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        var isFacedUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var flipCount : Int = 0
        var id: String
        var debugDescription: String{
            "\(id): \(content) : \(isFacedUp ? "up" : "down") : \(isMatched ? "matched" : "")"
        }
        
       
    }
}

extension Array{
    var only : Element? {
        count == 1 ? first : nil
    }
}
