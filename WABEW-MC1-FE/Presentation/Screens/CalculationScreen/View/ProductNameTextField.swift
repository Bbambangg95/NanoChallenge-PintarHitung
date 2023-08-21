//
//  ProductNameTextField.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct ProductNameTextField: View {
    @Binding var productName: String
    var placeHolder: String
    var body: some View {
        TextFieldLayout {
            TextFieldLabel(label: "Nama Barang")
            HStack (alignment: .bottom) {
                TextField(placeHolder, text: $productName, prompt: Text(placeHolder))
                    .font(.system(size: 25))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                Text("\(productName.count)/20")
                    .font(.footnote)
                if !productName.isEmpty {
                    Button {
                        productName = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color("neutral20"))
                    }
                }
            }
            .onChange(of: productName, perform: { newValue in
                if newValue.count > 20 {
                    productName = String(newValue.prefix(20))
                }
            })
        }
    }
}
