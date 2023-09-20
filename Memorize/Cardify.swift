//
//  Cardify.swift
//  Memorize
//
//  Created by S1OLY on 9/15/23.
//

import Foundation
import SwiftUI

struct Cardify : ViewModifier, Animatable {
    
    init(isFacedUp : Bool){
        rotation = isFacedUp ? 0 : 180
    }
    
    var isFacedUp : Bool{
        rotation < 90
    }
    
    var rotation : Double
    
    var animatableData: Double {
        get{
            rotation
        }
        set{
            rotation = newValue
        }
    }
    
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
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
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
