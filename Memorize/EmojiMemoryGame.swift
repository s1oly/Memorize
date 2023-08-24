//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by S1OLY on 8/17/23.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    @Published private var model : MemoryGame<String>
    @Published private var themes : Theme
    
    init (_ theme : Theme){
        themes = theme
        let selectedTheme = theme.randomTheme()
        model = EmojiMemoryGame.createMemoryGame(selectedTheme)
    }
    
   
    private static func createMemoryGame(_ theme : Theme.indvThemes) -> MemoryGame<String>{
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
    
    var themesList : Array<Theme.indvThemes>{
        return themes.Themes
    }
    
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func selectedTheme() -> Theme.indvThemes{
        themes.randomTheme()
    }
    
    func resetCards(){
        model.reset()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        model = EmojiMemoryGame.createMemoryGame(selectedTheme())
    }
    
    
    
}
