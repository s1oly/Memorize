//
//  Themes.swift
//  Memorize
//
//  Created by S1OLY on 8/21/23.
//

import Foundation

struct Theme {
    
    private(set) var Themes : Array<indvThemes>
    
    init() {
        Themes = []
        Themes.append(indvThemes("Red",["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️"].shuffled(),Int.random(in: 0..<12), "Vehicles"))
        Themes.append(indvThemes("Blue",["😀","😃","😄","😆","🥹","😅","😂","🤣","🥲","☺️","😊","😇"].shuffled(),Int.random(in: 0..<12), "Faces"))
        Themes.append(indvThemes("Green", ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒"].shuffled(),Int.random(in: 0..<12),"Food"))
        Themes.append(indvThemes("Yellow",["🏳️","🏴","🏴‍☠️","🏁","🚩","🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱","🇩🇿"].shuffled(),Int.random(in: 0..<12),"Flags"))
        Themes.append(indvThemes("Orange",["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁"].shuffled(),Int.random(in: 0..<12),"Animals"))
        Themes.append(indvThemes("Purple",["⛺️","🛖","🏠","🏡","🏘️","🏚️","🏗️","🏭","🏢","🏬","🏣","🏤"].shuffled(),Int.random(in: 0..<12),"Buildings"))
    }
    
            func randomTheme() -> indvThemes{
        Themes[Int.random(in: 0..<Themes.count)]
    }
    
    struct indvThemes{
        
        var Color : String
        var Emojis : [String]
        var numOfPairs: Int
        var Name : String
        
        init(_ Color: String, _ Emojis: [String], _ numOfPairs: Int, _ Name: String) {
            self.Color = Color
            self.Emojis = Emojis
            self.numOfPairs = numOfPairs
            self.Name = Name
        }
        
    }
    
    
}


