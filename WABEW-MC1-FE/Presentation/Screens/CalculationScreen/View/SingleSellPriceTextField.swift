//
//  SingleSellPriceTextField.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct SingleSellPriceTextField: View {
    @Binding var singleSellPrice: String
    var placeholder: String
    var body: some View {
        HStackTextFieldLayout {
            CircleImageView(
                iconImageName: "tag.circle.fill",
                iconBgColor: Color.successSpecial)
            VStack (alignment: .leading) {
                TextFieldLabel(label: "Harga Jual per Pcs")
                HStack {
                    CurrencyLabelView()
                    TextFieldWithDeleteButton(text: $singleSellPrice, placeholder: placeholder)
                }
            }
        }
    }
}

