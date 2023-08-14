//
//  ContentView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️","🚘","🛬","🗼","🚙","🛻"]
    @State var emojiCount = 3
    var body: some View{
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount],id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
    }
    var remove : some View{
        Button{
            if emojiCount > 1{
                emojiCount -= 1
            }
        } label:{
            Image(systemName: "minus.circle")
        }
    }
    var add : some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label:{
            Image(systemName: "plus.circle")
        }
    }
}







struct CardView: View{
    var content: String
    @State var FacedUp: Bool = false
    var body: some View{
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if FacedUp{
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: 3)
                    Text(content).font(Font.largeTitle)
                }
                else{
                    shape.fill().foregroundColor(.red)
                }
                    
            }
            .onTapGesture{
                FacedUp = !FacedUp
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

