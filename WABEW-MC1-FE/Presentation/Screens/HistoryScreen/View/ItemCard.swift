//
//  ItemCard.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import SwiftUI

struct ItemCard: View{
    public let iconBgColor: Color
    public let iconColor: Color
    public let imgIconName: String
    public let labelText: String
    public let valueText: String
    public let width: CGFloat
    
    init(iconBgColor: Color = Color("neutral40"), iconColor: Color = .white, imgIconName: String, labelText: String, valueText: String, width: CGFloat = .infinity) {
        self.iconBgColor = iconBgColor
        self.iconColor = iconColor
        self.imgIconName = imgIconName
        self.labelText = labelText
        self.valueText = valueText
        self.width = width
    }
    
    var body: some View{
        HStack(alignment: .center){
            ZStack{
                Circle()
                    .fill(iconBgColor)
                    .frame(maxWidth: 48, maxHeight: 48)
                Image(systemName: imgIconName)
                    .resizable()
                    .frame(maxWidth: 26, maxHeight: 26)
                    .foregroundColor(iconColor)
            }
            .padding(.trailing, 6)
            
            VStack(alignment: .leading){
                Text(labelText)
                    .font(.system(.subheadline))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(valueText)
                    .font(.system(.title, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(12)
        .frame(maxWidth: width, maxHeight: 72)
        .background(.white)
        .cornerRadius(12)
    }
}
