//
//  ContentView.swift
//  Memorize
//
//  Created by S1OLY on 8/8/23.
//

import SwiftUI

struct ContentView: View {
    // Emojis Array has @State in front as we need to modify it when each one of the buttons is pressed
     @State var emojis = ["✈️","🚘","🛬","🗼","🚙","🛻","🚐","🛺","🚔","🚍","🛰️","🛩️","🚤","🚁","🛶","🚠"]
    //The following three arrays are the same size as emojis and correspond to each type of card
 
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
                
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(Color.red)
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

