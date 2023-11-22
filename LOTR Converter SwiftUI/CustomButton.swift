//
//  Button.swift
//  LOTR Converter SwiftUI
//
//  Created by Italo Stuardo on 22/11/23.
//

import SwiftUI

struct CustomButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Done")
                .padding(10)
        }
        .background(.black.opacity(0.5))
        .foregroundStyle(.white)
        .font(.title)
        .clipShape(.buttonBorder)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomButton()
}
