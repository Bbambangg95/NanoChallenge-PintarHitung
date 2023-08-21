//
//  HStackTextFieldLayout.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct HStackTextFieldLayout<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        HStack (alignment: .center) {
            content()
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
    }
}
