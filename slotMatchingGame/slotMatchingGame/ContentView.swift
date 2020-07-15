//
//  ContentView.swift
//  slotMatchingGame
//
//  Created by XIN on 7/15/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
                
                //credites counter
                Text("Credits: 1000")
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.5))
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                //Cards
                HStack {
                    Spacer()
                    
                    Image("apple").resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    Image("apple").resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)

                    Image("apple").resizable()
                        .aspectRatio(1, contentMode:.fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Spacer()

                }
                //Button
                Button(action: {
                    //Todo
                }) {
                    Text("Spin")
                    .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
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
