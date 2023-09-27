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
                        score = score + 2 + cards[chosenIndex].bonus
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
        var isFacedUp : Bool = false{
            didSet{
                if isFacedUp{
                    startUsingBonusTime()
                }
                else{
                    stopUsingBonusTime()
                }
            }
        }
        var isMatched : Bool = false{
            didSet{
                if isMatched{
                    stopUsingBonusTime()
                }
            }
        }
        var content : CardContent
        var flipCount : Int = 0
  
        // MARK: - Bonus Time
        
        // call this when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isFacedUp && !isMatched && bonusPercentRemaining > 0, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        // call this when the card goes back face down or gets matched
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            lastFaceUpDate = nil
        }
        
        // the bonus earned so far (one point for every second of the bonusTimeLimit that was not used)
        // this gets smaller and smaller the longer the card remains face up without being matched
        var bonus: Int {
            Int(bonusPercentRemaining != 0 ? bonusTimeLimit * bonusPercentRemaining : 0)
        }
        
        // percentage of the bonus time remaining
        var bonusPercentRemaining: Double {
            bonusTimeLimit > 0 ? max(0, (bonusTimeLimit - faceUpTime))/bonusTimeLimit : 0
        }
        
        // how long this card has ever been face up and unmatched during its lifetime
        // basically, pastFaceUpTime + time since lastFaceUpDate
        var faceUpTime: TimeInterval {
            if let lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        // can be zero which would mean "no bonus available" for matching this card quickly
        var bonusTimeLimit: TimeInterval = 6
        
        // the last time this card was turned face up
        var lastFaceUpDate: Date?
        
        // the accumulated time this card was face up in the past
        // (i.e. not including the current time it's been face up if it is currently so)
        var pastFaceUpTime: TimeInterval = 0
        
        
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
