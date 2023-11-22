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
            InputForm(
                leftAmount: $leftAmount,
                rightAmount: $rightAmount,
                leftCurrency: $leftCurrency,
                rightCurrency: $rightCurrency,
                isLeftIcon: true
            )
            Image(systemName: "equal")
                .font(.largeTitle)
                .foregroundColor(.white)
            InputForm(
                leftAmount: $leftAmount,
                rightAmount: $rightAmount,
                leftCurrency: $leftCurrency,
                rightCurrency: $rightCurrency,
                isLeftIcon: false
            )
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FormContainer(leftAmount: .constant(""), rightAmount: .constant(""), leftCurrency: .constant(.goldPenny), rightCurrency: .constant(.goldPiece))
}
