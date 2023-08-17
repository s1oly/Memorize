//
//  ContentView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    // Emojis Array has @State in front as we need to modify it when each one of the buttons is pressed
    @State var emojis :[String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p"]
    //The following three arrays are the same size as emojis and correspond to each type of card
    var vehiclemojis =  ["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️","🚤","🚁","🛶","🚠"]
    var peopleemojis = ["😀","😃","😄","😁","😆","🥹","😅","😂", "🤣", "🥲","☺️","😇","🙂","🙃","😉","😌"]
    var flagemojis = ["🏳️","🏴","🏴‍☠️","🏁","🚩","🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇴","🇦🇮"]
    //
    @State var emojiCount = 8
    var body: some View{
        VStack{
            Text("Memorize!").foregroundColor(.black).font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]){
                    ForEach(emojis[0..<emojiCount],id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(3/5,contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack{
                vehicle
                Spacer()
                faces
                Spacer()
                flags
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
    }

    var vehicle : some View{
        VStack{
            Button{
                emojis.replace(emojis[0..<emojis.count], with: vehiclemojis.shuffled())
                emojiCount = Int.random(in: 4...15)
            } label: {
                Image(systemName: "car.circle")
            }
            Text("Vehicles").font(.footnote)
        }
    }
    
    var faces : some View{
        VStack{
            Button{
                emojis.replace(emojis[0..<emojis.count], with: peopleemojis.shuffled())
                emojiCount = Int.random(in: 4...15)
            } label: {
                Image(systemName: "person.circle")
            }
            Text("Faces").font(.footnote)
        }
    }
    
    var flags : some View{
        VStack{
            Button{
                emojis.replace(emojis[0..<emojis.count], with: flagemojis.shuffled())
                emojiCount = Int.random(in: 4...15)
            } label: {
                Image(systemName: "flag.circle")
            }
            Text("Flags").font(.footnote)
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
                    shape.strokeBorder(lineWidth: 8)
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

