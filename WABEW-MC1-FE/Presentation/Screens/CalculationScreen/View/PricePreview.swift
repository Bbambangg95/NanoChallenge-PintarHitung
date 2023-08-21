//
//  PricePreview.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct PricePreview: View {
    var type: String
    var value: Double
    var body: some View {
        VStack (alignment: .leading) { //Box modal multi
            HStack {
                Text("Modal/\(type) :")
                Text("Rp\(value,  specifier: "%.0f"),-")
                    .fontWeight(.semibold)
            }
        }
        .padding(8)
        .background(Color("secondary10"))
        .cornerRadius(10)
        .padding(.top, 8)
    }
}
