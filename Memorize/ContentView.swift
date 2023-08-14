//
//  ContentView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
        
    
    }
        
}


struct CardView: View{
    var FacedUp: Bool  = true
    
    var body: some View{
        HStack{
            ZStack{
                if FacedUp{
                    RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    Text("✈️")
                    .font(Font.largeTitle)
                }
                else{
                    RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                }
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

