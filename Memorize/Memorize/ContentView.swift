//
//  MemorizeView.swift
//  Memorize
//
//  Created by Jinbae Jeong on 2022/06/25.
//

import SwiftUI

struct MemorizeView: View {
    var emojis = ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"]
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        CardView(content: $0)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeView()
            .preferredColorScheme(.dark)
        
        MemorizeView()
            .preferredColorScheme(.light)
    }
}
