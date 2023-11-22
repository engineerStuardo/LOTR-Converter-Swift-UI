//
//  SelectCurrency.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct SelectCurrency: View {
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack {
            Image("parchment")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .bold()
                    .multilineTextAlignment(.center)
                IconGrid(currency: $leftCurrency)
                Text("Select the currency you would like to convert to:")
                    .bold()
                    .multilineTextAlignment(.center)
                IconGrid(currency: $rightCurrency)
                CustomButton()
            }
        }
    }
}

#Preview {
    SelectCurrency(leftCurrency: .constant(.silverPiece), rightCurrency: .constant(.goldPiece))
}
