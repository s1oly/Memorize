//
//  Cardify.swift
//  Memorize
//
//  Created by S1OLY on 9/15/23.
//

import Foundation
import SwiftUI

struct Cardify : ViewModifier {
    let isFacedUp : Bool
    func body(content : Content) -> some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: Constants.CornerRadius)
            base.strokeBorder(lineWidth:Constants.lineWidth)
                    .background(base.fill(.white))
                    .overlay(content)
                    .opacity(isFacedUp ? 1 : 0)
            base.fill()
                    .opacity(isFacedUp ? 0 : 1)
            
        }
    }
    
    struct Constants{
        static let CornerRadius : CGFloat = 12
        static let lineWidth : CGFloat = 2
    }
    
}

extension View {
    func cardify(isFacedup : Bool ) -> some View{
        modifier(Cardify(isFacedUp: isFacedup))
    }
}
