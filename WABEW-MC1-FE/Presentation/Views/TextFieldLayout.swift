//
//  TextFieldLayout.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct TextFieldLayout<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack (alignment: .leading) {
            content()
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
    }
}
