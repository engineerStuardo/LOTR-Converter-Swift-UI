//
//  ContentView.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftAmount = ""
    @State var rightAmount = ""
    @State var leftCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "leftCurrency")) ?? .silverPiece
    @State var rightCurrency: Currency = Currency(rawValue: UserDefaults.standard.double(forKey: "rightCurrency")) ?? .goldPiece
    @State var showExchangeInfo = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("prancingpony")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                FormContainer(
                    leftAmount: $leftAmount,
                    rightAmount: $rightAmount,
                    leftCurrency: $leftCurrency,
                    rightCurrency: $rightCurrency
                )
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
