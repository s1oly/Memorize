//
//  Themes.swift
//  Memorize
//
//  Created by S1OLY on 8/21/23.
//

import Foundation

struct Themes {
    
    private(set) var Themes : Array<Theme> = []
    
    init() {
        Themes.append(Theme(Color: "Red",Emojis: ["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️"].shuffled(),numOfPairs: Int.random(in: 5..<12), Name: "Vehicles"))
        Themes.append(Theme(Color: "Blue",Emojis: ["😀","😃","😄","😆","🥹","😅","😂","🤣","🥲","☺️","😊","😇"].shuffled(),numOfPairs: Int.random(in: 5..<12), Name: "Faces"))
        Themes.append(Theme(Color: "Green", Emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒"].shuffled(),numOfPairs: Int.random(in: 5..<12),Name: "Food"))
        Themes.append(Theme(Color: "Yellow",Emojis: ["🏳️","🏴","🏴‍☠️","🏁","🚩","🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱","🇩🇿"].shuffled(),numOfPairs: Int.random(in: 5..<12),Name: "Flags"))
        Themes.append(Theme(Color: "Orange",Emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁"].shuffled(),numOfPairs: Int.random(in: 5..<12),Name: "Animals"))
        Themes.append(Theme(Color: "Purple",Emojis: ["⛺️","🛖","🏠","🏡","🏘️","🏚️","🏗️","🏭","🏢","🏬","🏣","🏤"].shuffled(),numOfPairs: Int.random(in: 5..<12),Name: "Buildings"))
    }
    
        func randomTheme () -> Theme {
        Themes.randomElement()!
    }
    
    
    struct Theme : Equatable{
        
        var Color : String
        var Emojis : [String]
        var numOfPairs: Int
        var Name : String
        
    }
    
}


