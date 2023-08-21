import SwiftUI

struct ResultModal: View {
//    public var id : String
    @ObservedObject var calculatorVM: CalculatorViewModel
    @Binding var isNavigateToDetail: Bool
   
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button("Selesai"){
                    calculatorVM.showResultModal = false
                }
            }.padding(.top, 8)
            VStack (alignment: .center){
                Text("Titik Balik Modal")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(10)
                Text("Agar dapat balik modal, anda perlu menjual barang anda sebanyak:")
                    .multilineTextAlignment(.center)
                VStack {
                    if (calculatorVM.isMultiTypeSelected){
                        Text("\(String(format: "%.1f", calculatorVM.unitBEP).replacingOccurrences(of: ".", with: ",")) Pcs")
                            .font(.system(size: 34))
                            .fontWeight(.semibold)
                        Text("(\(Image(systemName: "plusminus")) \(calculatorVM.itemBEP, specifier: "%.1f") \(calculatorVM.selectedItemType))")
                            .font(.footnote)
                        
                    } else {
                        Text("\(String(format: "%.1f", calculatorVM.itemBEP).replacingOccurrences(of: ".", with: ",")) \(calculatorVM.selectedItemType)")
                            .font(.system(size: 34))
                            .fontWeight(.semibold)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color("secondary10"))
                .cornerRadius(8)
                VStack (alignment: .leading, spacing: 0) {
                    HStack{
                        Image(systemName: "checkmark.circle.fill")
                        Text("Profit (Unit/Rupiah)")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 2)
                    if (calculatorVM.isMultiTypeSelected) {
                        Text("\(String(format: "%.1f", calculatorVM.unit_profit_size).replacingOccurrences(of: ".", with: ",")) Pcs = \(CurrencyFormatter.getCurrencyFormat(value: calculatorVM.unitProfit))")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                    } else {
                        Text("\(String(format: "%.1f", calculatorVM.unit_profit_size).replacingOccurrences(of: ".", with: ",")) \(calculatorVM.selectedItemType) = \(CurrencyFormatter.getCurrencyFormat(value: calculatorVM.profit))")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 3)
                    }
                    Spacer()
                        .frame(height: 4)
                    Text("Total keuntungan jika anda menjual seluruh barang").font(.system(.body)).fontDesign(.rounded).frame(maxWidth: .infinity, alignment: .leading).padding(.top, 4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .background(Color("secondary10"))
                .cornerRadius(10)
            }
            ButtonView(label: "Lihat Selengkapnya") {
                calculatorVM.showResultModal = false
                isNavigateToDetail = true
            }
        }
        .padding()
        .presentationDetents([.fraction(0.6)])
    }
}
