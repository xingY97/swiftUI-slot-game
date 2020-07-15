//
//  ContentView.swift
//  slotMatchingGame
//
//  Created by XIN on 7/15/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "cherry", "star"]
    
    @State private var number = [0,0,0]
    @State private var credits = 1000
    private var betAmount = 5
    
    var body: some View {
        
        
        //Background
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 75))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    
                    Text("SwiftUI slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                }.scaleEffect(2)
                
                
                Spacer()
                
                //credites counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.5))
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                
                Spacer()
                
                //Cards
                HStack {
                    
                    
                    Image(symbols[number[0]])
                        .resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image(symbols[number[1]])
                        .resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)

                    Image(symbols[number[2]])
                        .resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        
                
                }
                
                Spacer()
                
                //Button
                Button(action: {
                    
                    //change the images
                    self.number[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.number[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    //Check winnings
                    if self.number[0] == self.number[1] && self.number[1] == self.number[2] {
                        
                        //won
                        self.credits += self.betAmount * 10
                    }
                    else {
                        self.credits -= self.betAmount
                    }
                    
                    
                    
                    
                }) {
                    Text("Spin")
                    .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                    
                }
            }
            
        }
        
    }
}











// online run if in debug mode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
