//
//  ExchangeRate.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: String
    @State var text: String
    @State var rightImage: String
    
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ExchangeRate(
        leftImage: "goldpiece",
        text: "1 Gold Piece = 4 Gold Pennies",
        rightImage: "goldpenny"
    )
}
