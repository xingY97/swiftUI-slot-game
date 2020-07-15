//
//  ContentView.swift
//  slotMatchingGame
//
//  Created by XIN on 7/15/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["photograph", "beach", "backpack"]
    @State private var number = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 100
    private var betAmount = 10
    
    var body: some View {
        
        
        //Background
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 50/255, green: 80/255, blue: 70/255))
                .edgesIgnoringSafeArea(.all)
            
//            Rectangle()
//                .foregroundColor(Color(red: 228/255, green: 100/255, blue: 70/255))
//                .rotationEffect(Angle(degrees: 75))
//                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                    
                    Text("Slot Matching Game")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.green)
                }.scaleEffect(2)
                
                
                Spacer()
                
                //credites counter
                HStack {
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Initial Credits: " + String(credits))
                        .foregroundColor(.white)
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                }


                Spacer()
                
                //Cards
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[number[0]],background: $backgrounds[0])
                        
                        CardView(symbol: $symbols[number[1]],background: $backgrounds[1])
                        
                        CardView(symbol: $symbols[number[2]],background: $backgrounds[2])
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[number[3]],background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[number[4]],background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[number[5]],background: $backgrounds[5])
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        CardView(symbol: $symbols[number[6]],background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[number[7]],background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[number[8]],background: $backgrounds[8])
                        
                        Spacer()
                    }
                    
                }

                Spacer()
                
                //Button
                HStack (spacing: 20 ){
                    
                    VStack {
                        Button(action: {
                            
                            //process a single spin
                            self.processResult()
                            
                            
                        }) {
                            Text("Min bet")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                            
                        }
                        Text("\(betAmount) credits").foregroundColor(Color.white).padding(.top, 10).font(.footnote)
                    }
                    
                    VStack {
                        Button(action: {
                            
                            //process a single spin
                            self.processResult(true)
                            
                            
                        }) {
                            Text("Max bet")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                            
                        }
                        Text("\(betAmount * 2) credits").foregroundColor(Color.white).padding(.top, 10).font(.footnote)
                    }
                    
                }
                
                
                
                
                Spacer()
            }
            
        }
        
    }
    func processResult(_ isMax:Bool = false) {
        
        //Set backgrounds back to white
        self.backgrounds[0] = Color.white
        self.backgrounds[1] = Color.white
        self.backgrounds[2] = Color.white
        
        //        self.backgrounds = self.backgrounds.map { _ in
        //            Color.white
        //        }
        
        if isMax {
            // spin all the cards
            self.number = self.number.map({ _ in Int.random(in: 0...self.symbols.count - 1)
            })
        }
        else {
            //spin the middle row
            //change the images
            self.number[3] = Int.random(in: 0...self.symbols.count - 1)
            
            self.number[4] = Int.random(in: 0...self.symbols.count - 1)
            
            self.number[5] = Int.random(in: 0...self.symbols.count - 1)
        }
        
        
        
        //Check winnings
        processWin(isMax)
    }
    
    func processWin (_ isMax:Bool = false) {
        
        var matches = 0
        
        if !isMax {
            
            //processing for single spin
            if isMatch(3, 4, 5) { matches += 1}
        }
        else {
            //processing for max spin
            
            //top row
            if isMatch(0, 1, 2) { matches += 1}
            
            //middle row
            if isMatch(3, 4, 5) { matches += 1}
            
            //bottom row
            if isMatch(6, 7, 8) { matches += 1}
            
            //Diagonal top left to bottom right
            if isMatch(0, 4, 8) { matches += 1}
            
            //Diagonal top right to bottom left
            if isMatch(2, 4, 6) { matches += 1}
        }
        //check matches and distribute credits
        if matches > 0 {
            //at least 1 win
            self.credits += matches * betAmount * 2
        }
        else if !isMax {
            //0 wins, single spin
            self.credits -= betAmount
        }
        else {
            //0 wins, max spin
            self.credits -= betAmount * 5
        }
    }
    func isMatch (_ index1:Int, _ index2:Int, _ index3:Int) ->
        Bool {
            
            if self.number[index1] == self.number[index2] &&
                self.number[index2] == self.number[index3]{
                
                self.backgrounds[index1] = Color.green
                self.backgrounds[index2] = Color.green
                self.backgrounds[index3] = Color.green
                
                return true
            }
            return false
    }
}

// online run if in debug mode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
