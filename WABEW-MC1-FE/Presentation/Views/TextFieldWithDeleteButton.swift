//
//  TextFieldWithDeleteButton.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct TextFieldWithDeleteButton: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        HStack (alignment: .bottom) {
            TextField(placeholder, text: $text)
                .font(.system(size: 25))
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .keyboardType(.decimalPad)
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.neutral20)
                }
            }
        }
    }
}
