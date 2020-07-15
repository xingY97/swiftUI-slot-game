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
                    
                    self.credits += 1
                    
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
