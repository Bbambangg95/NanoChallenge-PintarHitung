//
//  ItemFieldView.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import SwiftUI

struct ItemTextField: View {
    @Binding var multiItemCount: String
    @Binding var singleItemCount: String
    @Binding var selectedItemType: String
    @State private var showOptionModal: Bool = false
    @Binding var isMultiTypeSelected: Bool
    var body: some View {
        HStack {
            multiItemField
            if isMultiTypeSelected {
                singleItemField
            }
        }
        .sheet(isPresented: $showOptionModal) {
            itemOptionModalView
        }
    }
    private var multiItemField: some View {
        HStackTextFieldLayout {
            CircleImageView(
                iconImageName: "shippingbox.fill",
                iconBgColor: Color.danger40)
            ZStack (alignment: .topTrailing) {
                VStack (alignment: .leading) {
                    TextFieldLabel(label: "Jumlah \(selectedItemType)")
                    TextFieldWithDeleteButton(text: $multiItemCount, placeholder: "\(isMultiTypeSelected ? "Jumlah" : "Ketik  Jumlah")")
                }
                Button {
                    showOptionModal = true
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.neutral80)
                }
            }
        }
    }
    private var singleItemField: some View {
        TextFieldLayout {
            TextFieldLabel(label: "Pcs per \(selectedItemType)")
            TextFieldWithDeleteButton(text: $singleItemCount, placeholder: "Jumlah")
        }
        .frame(maxWidth: 140)
    }
    private var itemOptionModalView: some View {
        VStack{
            HStack {
                Spacer()
                Button("Selesai"){
                    showOptionModal = false
                }
            }
            Picker(selection: $selectedItemType, label: Text("Select")) {
                ForEach(ItemType.allCases, id: \.self) {
                    option in Text(option.rawValue).tag(option.rawValue)
                }
                .onChange(of: selectedItemType) { newValue in
                    switch newValue {
                    case ItemType.pcs.rawValue, ItemType.kg.rawValue:
                        isMultiTypeSelected = false
                    default:
                        isMultiTypeSelected = true
                    }
                }
            }
            .pickerStyle(.wheel)
        }
        .padding()
        .presentationDetents([.height(300), .medium, .large])
    }
}
