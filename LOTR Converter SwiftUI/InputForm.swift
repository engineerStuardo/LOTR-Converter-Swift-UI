//
//  InputForm.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 22/11/23.
//

import SwiftUI

struct InputForm: View {
    @Binding var leftAmount: String
    @Binding var rightAmount: String
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var showSelectCurrency = false
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    @State var isLeftIcon: Bool
    
    var body: some View {
        VStack {
            HStack {
                if isLeftIcon {
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                    Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                        .font(.headline)
                        .foregroundStyle(.white)
                } else {
                    Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                }
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
            }
            TextField("Amount", text: $leftAmount, onEditingChanged: { typing in
                leftTyping = typing
                leftAmountTemp = leftAmount
            })
                .padding(7)
                .background()
                .clipShape(.buttonBorder)
                .keyboardType(.decimalPad)
                .onChange(of: leftTyping ? leftAmount : leftAmountTemp) { oldValue, newValue in
                    rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                }
                .onChange(of: leftCurrency) { oldValue, newValue in
                    leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    InputForm(leftAmount: .constant(""), rightAmount: .constant(""), leftCurrency: .constant(.goldPiece), rightCurrency: .constant(.goldPenny), isLeftIcon: true)
}
