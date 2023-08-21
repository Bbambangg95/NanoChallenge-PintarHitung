//
//  CurrencyLabelView.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct CurrencyLabelView: View {
    var body: some View {
        Text("Rp")
            .font(.system(size: 25))
            .fontDesign(.rounded)
            .fontWeight(.semibold)
            .padding(.trailing, -5)
    }
}

struct CurrencyLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyLabelView()
    }
}
