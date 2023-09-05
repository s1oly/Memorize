//
//  MemorizeApp.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game  = EmojiMemoryGame(Themes())
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
