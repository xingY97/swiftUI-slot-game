//
//  CardView.swift
//  slotMatchingGame
//
//  Created by XIN on 7/15/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol:String
    @Binding var background:Color
    
    var body: some View {
        
        Image(symbol)
        .resizable()
        .aspectRatio(1, contentMode:.fit)
        .background(background.opacity(0.5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("backpack"), background: Binding.constant(Color.green))
    }
}
