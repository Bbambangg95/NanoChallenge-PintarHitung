//
//  CircleImageView.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct CircleImageView: View {
    var iconImageName: String
    var iconBgColor: Color
    var body: some View {
        ZStack{
            Circle()
                .fill(iconBgColor)
                .frame(maxWidth: 48, maxHeight: 48)
            Image(systemName: iconImageName)
                .resizable()
                .frame(maxWidth: 25, maxHeight: 25)
                .foregroundColor(Color.white)
        }
    }
}
