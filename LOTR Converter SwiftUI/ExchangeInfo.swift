//
//  ExchangeInfo.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world, except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                ExchangeRate(
                    leftImage: "goldpiece",
                    text: "1 Gold Piece = 4 Gold Pennies",
                    rightImage: "goldpenny"
                )
                ExchangeRate(
                    leftImage: "goldpenny",
                    text: "1 Gold Penny = 4 Silver Pieces",
                    rightImage: "silverpiece"
                )
                ExchangeRate(
                    leftImage: "silverpiece",
                    text: "1 Silver Piece = 4 Silver Pennies",
                    rightImage: "silverpenny"
                )
                ExchangeRate(
                    leftImage: "silverpenny",
                    text: "1 Silver Penny = 100 Copper Pennies",
                    rightImage: "copperpenny"
                )
                CustomButton()
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}
