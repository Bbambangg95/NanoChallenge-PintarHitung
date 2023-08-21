//
//  TextFieldLabel.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct TextFieldLabel: View {
    var label: String
    var body: some View {
        Text(label)
            .fontDesign(.rounded)
            .font(.system(size: 14))
            .offset(y: 6)
    }
}
