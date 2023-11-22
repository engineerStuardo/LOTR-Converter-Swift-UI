//
//  CurrencyIcon.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var icon: String
    @State var title: String
    
    var body: some View {
        ZStack {
            Image(icon)
                .resizable()
                .scaledToFit()
            VStack {
                Spacer()
                Text(title)
                    .font(.caption)
                    .background(.brown.opacity(0.75))
                    .padding(3)
                    .bold()
            }
        }
        .background(.brown)
        .clipShape(.buttonBorder)
        .padding(3)
        .frame(width: 100, height: 100)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CurrencyIcon(icon: "goldpenny", title: "Copper Penny")
}
