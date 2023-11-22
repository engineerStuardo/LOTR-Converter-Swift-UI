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
    @State var keyPath: String
    
    var body: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(0..<5) { i in
                let currencyImageTemp = CurrencyImage.allCases[i]
                let currencyTextTemp = CurrencyText.allCases[i]
                let currencyTemp = Currency.allCases[i]
                
                if Currency.allCases[i] == currency {
                    CurrencyIcon(
                        icon: currencyImageTemp.rawValue,
                        title: currencyTextTemp.rawValue
                    )
                    .overlay(RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.black, lineWidth: 2)
                        .opacity(0.5)
                    )
                    .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(
                        icon: currencyImageTemp.rawValue,
                        title: currencyTextTemp.rawValue
                    )
                    .onTapGesture {
                        currency = currencyTemp
                        UserDefaults.standard.setValue(currencyTemp.rawValue, forKeyPath: keyPath)
                    }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    IconGrid(currency: .constant(.goldPiece), keyPath: "leftCurrency")
}
