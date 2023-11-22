//
//  CurrencyView.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct IconGrid: View {
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(
                        icon: CurrencyImage.allCases[i].rawValue,
                        title: CurrencyText.allCases[i].rawValue
                    )
                    .overlay(RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.black, lineWidth: 2)
                        .opacity(0.5)
                    )
                    .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(
                        icon: CurrencyImage.allCases[i].rawValue,
                        title: CurrencyText.allCases[i].rawValue
                    )
                    .onTapGesture {
                        currency = Currency.allCases[i]
                    }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    IconGrid(currency: .constant(.goldPiece))
}
