//
//  FormContainer.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct FormContainer: View {
    
    @Binding var leftAmount: String
    @Binding var rightAmount: String
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    @State var showSelectCurrency = false
    @State var leftAmountTemp = ""
    @State var rightAmountTemp = ""
    @State var leftTyping = false
    @State var rightTyping = false
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                    Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: leftCurrency)!].rawValue)
                        .font(.headline)
                        .foregroundStyle(.white)
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
            Image(systemName: "equal")
                .font(.largeTitle)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Text(CurrencyText.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Image(CurrencyImage.allCases[Currency.allCases.firstIndex(of: rightCurrency)!].rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                }
                .padding(.bottom, -5)
                .onTapGesture {
                    showSelectCurrency.toggle()
                }
                .sheet(isPresented: $showSelectCurrency, content: {
                    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                })
                TextField("Amount", text: $rightAmount, onEditingChanged: { typing in
                    rightTyping = typing
                    rightAmountTemp = rightAmount
                })
                    .padding(7)
                    .background()
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
                    .onChange(of: rightTyping ? rightAmount : rightAmountTemp) { oldValue, newValue in
                        leftAmount = rightCurrency.convert(amountString: rightAmount, to: leftCurrency)
                    }
                    .onChange(of: rightCurrency) { oldValue, newValue in
                        rightAmount = leftCurrency.convert(amountString: leftAmount, to: rightCurrency)
                    }
            }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FormContainer(leftAmount: .constant(""), rightAmount: .constant(""), leftCurrency: .constant(.goldPenny), rightCurrency: .constant(.goldPiece))
}
