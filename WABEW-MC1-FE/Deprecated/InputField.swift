import SwiftUI

//struct InputField: View {
//
//    var labelText: String //textField property
//    public let placeholderText: String
//
//    var iconImageName: String = "" //icon property
//    var iconColor: String = ""
//    var iconBgColor: String = ""
//
//    var isOptionButtonShow: Bool = false //option button toggle
//
//    var isCurrShow: Bool = false //show currency label
//
//    private let formatter: NumberFormatter = {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 0
//        formatter.groupingSeparator = "."
//        return formatter
//    }()
//
//    @State private var currencyColor: Bool = false // "Rp" Currency color label
//
//    public let options = ["Pcs", "Kg", "Dus", "Pak", "Karung", "Lusin", "Rim", "Kodi"]
//    private var isMulti: Bool {options[2...7].contains(type)}
//
//    @Binding var textValue: String
//    @Binding var type: String
//
//    @State private var showOptionModal = false
//
//    var fieldAreEmpty: Bool = false // check all textfield value, when button is clicked
//    @State private var isAlert: Bool = false //show alert
//
//    @ScaledMetric private var placeholderSize: CGFloat = 25
//    @ScaledMetric private var labelSize: CGFloat = 15
//    @ScaledMetric private var labelOff: CGFloat = 10
//    @ScaledMetric private var iconOptionSize: CGFloat = 20
//
//    var body: some View {
//        VStack (alignment: .leading) {
//            HStack (alignment: .center) {
//                if !iconImageName.isEmpty { //show circle icon
//                    CircleImage(iconImageName: iconImageName, iconBgColor: iconBgColor)
//                }
//                VStack (alignment: .leading) {
//                    HStack (alignment: .center) {
//                        Text(labelText)
//                            .fontDesign(.rounded)
//                            .font(.system(size: 14))
//                            .offset(y: 6)
//                        Spacer()
//                        if isOptionButtonShow {
//                            Button(action: {
//                                showOptionModal.toggle()
//                            }) {
//                                Image(systemName: "chevron.down")
//                                    .font(.system(size: iconOptionSize))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color("neutral80"))
//                            }
//                            .offset(y: 7)
//                            .sheet(isPresented: $showOptionModal) {
//                                VStack{
//                                    HStack {
//                                        Spacer()
//                                        Button("Selesai"){
//                                            showOptionModal = false
//                                        }
//                                    }
//                                    Picker(selection: $type, label: Text("Select")) {
//                                        ForEach(options, id: \.self) {
//                                            option in Text(option)
//                                        }
//                                    }
//                                    .pickerStyle(.wheel)
//                                }
//                                .padding()
//                                .presentationDetents([.height(300), .medium, .large])
//                            }
//                        }
//                    }
//                    HStack {
//                        if isCurrShow { //Show "Rp" currency label
//                            Text("Rp")
//                                .font(.system(size: placeholderSize))
//                                .fontDesign(.rounded)
//                                .fontWeight(.semibold)
//                        }
//
//                        TextField(placeholderText, text: $textValue)
//                        .onTapGesture {
//                            self.currencyColor = true
//                        }
//                        .onChange(of: textValue, perform: { newValue in
//                            if newValue.count > 20 && labelText == "Nama Barang" {
//                                textValue = String(newValue.prefix(20))
//                            }
//                        })
//                        .font(.system(size: 25))
//                        .fontDesign(.rounded)
//                        .fontWeight(.semibold)
//                        .offset(x: isCurrShow ? -6 : 0)
//                        .keyboardType(labelText == "Nama Barang" ? .default : .decimalPad)
//
//                        if labelText == "Nama Barang" {
//                            Text("\(textValue.count)/20")
//                                .font(.footnote)
//                        }
//
//                        if !textValue.isEmpty { // Delete textField Value button
//                            Button {
//                                textValue = ""
//                            } label: {
//                                Image(systemName: "xmark.circle.fill")
//                                    .foregroundColor(Color("neutral20"))
//                            }
//
//                        }
//                    }
//                }
//            }
//            .padding(8)
//            .frame(maxHeight: 72)
//            .background(.white)
//            .cornerRadius(8)
//            .overlay{
//                //jika field kosong dan text nya
//                if fieldAreEmpty && textValue.isEmpty { //red line for frame alert overlay
//                    RoundedRectangle(cornerRadius: 8)
//                        .stroke(.secondary, lineWidth: 1)
//                        .foregroundColor(Color("danger40"))
//                }
//
//            }
//            if fieldAreEmpty && textValue.isEmpty {
//                Text("Isi \(labelText)!")
//                    .font(.footnote)
//                    .foregroundColor(Color("danger40"))
//                    .offset(y: -3)
//                    .padding(.bottom, -5)
//            }
//        }
//
//    }
//
//}
