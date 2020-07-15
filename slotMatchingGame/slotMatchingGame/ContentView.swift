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
        }
        
        }
    }

  









// online run if in debug mode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
