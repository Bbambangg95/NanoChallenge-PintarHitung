//
//  ButtonView.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct ButtonView: View {
    var label: String
    var isOutlined: Bool = false
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .font(.system(size:20))
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .padding()
                .foregroundColor(Color.neutral80)
                .frame(maxWidth: .infinity, maxHeight: 48)
        }
        .background(isOutlined ? Color.neutral5 : Color.secondary50)
        .cornerRadius(10)
        .overlay {
            if isOutlined {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.neutral40, lineWidth: 2)
            }
        }
        .padding(.vertical, 8)
    }
}
