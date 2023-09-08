//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    @Published private var model : MemoryGame<String>
    @Published private var themes : Themes.Theme
    
    init (_ theme : Themes){
        let firstTheme = theme.randomTheme()
        themes = firstTheme
        model = EmojiMemoryGame.createMemoryGame(firstTheme)
        
    }
    
   
    private static func createMemoryGame(_ theme : Themes.Theme) -> MemoryGame<String>{
        return MemoryGame(numofPairsofCards: theme.numOfPairs){ pairIndex in
            if theme.Emojis.indices.contains(pairIndex){
                return theme.Emojis[pairIndex]
           }
           else{
               return "⁉️"
           }
        }
    }
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    var themeColor : Color{
        switch themes.Color{
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
    
    var themeName : String {
        return themes.Name
    }
    
    var gameScore : Int{
        return model.score
    }
    
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func resetCards(){
        model.reset()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame( _ theme : Themes){
        themes = theme.randomTheme()
        model = EmojiMemoryGame.createMemoryGame(themes)
        model.shuffle()
        
    }
    
    
    
}
