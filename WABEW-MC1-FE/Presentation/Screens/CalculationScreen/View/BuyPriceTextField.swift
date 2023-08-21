//
//  BuyPriceTextFieldView.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct BuyPriceTextField: View {
    @Binding var totalBuyPrice: String
    var body: some View {
        HStackTextFieldLayout {
            CircleImageView(
                iconImageName: "dollarsign.circle.fill",
                iconBgColor: Color.primarySpecial)
            VStack (alignment: .leading) {
                TextFieldLabel(label: "Harga Beli Total")
                HStack {
                    CurrencyLabelView()
                    TextFieldWithDeleteButton(text: $totalBuyPrice, placeholder: "0")
                }
            }
        }
    }
}
