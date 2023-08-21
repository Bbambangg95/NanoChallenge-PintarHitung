//
//  MultiSellPriceTextField.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct MultiSellPriceTextField: View {
    @Binding var multiSellPrice: String
    @Binding var selectedItemType: String
    var body: some View {
        HStackTextFieldLayout {
            CircleImageView(
                iconImageName: "tag.circle.fill",
                iconBgColor: Color.successSpecial)
            VStack (alignment: .leading) {
                TextFieldLabel(label: "Harga Jual per \(selectedItemType)")
                HStack {
                    CurrencyLabelView()
                    TextFieldWithDeleteButton(text: $multiSellPrice, placeholder: "0")
                }
            }
        }
    }
}

