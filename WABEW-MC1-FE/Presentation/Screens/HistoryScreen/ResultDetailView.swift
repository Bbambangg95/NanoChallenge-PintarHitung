import SwiftUI

struct ResultDetailView: View {
    public var item: Product
    
    func isSingleType() -> Bool{
        return (item.type == "Kg" || item.type == "Pcs")
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text("Titik Balik Modal")
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
            InfoCard(subtitle: "Untuk menutup pengeluaran, anda harus menjual:",
                     bgColor: "secondary5",
                     imgIconName: "shippingbox.fill",
                     valueSingle: isSingleType() ? "\(String(format: "%.2f", item.itemBEP).replacingOccurrences(of: ".", with: ",")) \(item.type)" : "\(String(format: "%.2f", item.unitBEP).replacingOccurrences(of: ".", with: ",")) Pcs",
                     valueMulti: "\(String(format: "%.2f", item.itemBEP).replacingOccurrences(of: ".", with: ",")) \(item.type)",
                     formulaSingle: "Harga Beli Total / Harga Jual Per \(isSingleType() ? item.type : "Pcs")",
                     formulaMulti: "Harga Beli Total / Harga Jual Per \(item.type)",
                     formulaSingleText: "\(CurrencyFormatter.getCurrencyFormat(value: item.totalBuyPrice)) / \(CurrencyFormatter.getCurrencyFormat(value: item.singleSellPrice))",
                     formulaMultiText: "\(CurrencyFormatter.getCurrencyFormat(value: item.totalBuyPrice)) / \(CurrencyFormatter.getCurrencyFormat(value: item.multiSellPrice))",
                     isTBM: true,
                     type: item.type,
                     isSingle: isSingleType()
            )
            .padding(.bottom)
            
            Text("Keuntungan")
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
            InfoCard (
                subtitle: "Jika anda menjual seluruh item, maka keuntungan:",
                bgColor: "mint",
                imgIconName: "dollarsign.circle.fill",
                valueSingle: CurrencyFormatter.getCurrencyFormat(value: item.unitProfit),
                valueMulti: CurrencyFormatter.getCurrencyFormat(value: item.profit),
                formulaSingle: "((Jumlah \(item.type) x Jumlah Pcs/\(item.type)) - Titik Balik Modal Pcs) x Harga Jual per Pcs",
                formulaMulti: "(Jumlah \(item.type) - Titik Balik Modal \(item.type)) x Harga Jual per \(item.type)",
                formulaSingleText: "= ((\(item.multiItemCount) x \(item.singleItemCount)) - \(String(format: "%.2f", item.unitBEP).replacingOccurrences(of: ".", with: ","))) x \(CurrencyFormatter.getCurrencyFormat(value : item.singleSellPrice))",
                formulaMultiText: "= (\(String(item.multiItemCount).replacingOccurrences(of: ".", with: ",")) - \(String(format: "%.2f", item.itemBEP).replacingOccurrences(of: ".", with: ","))) x \(CurrencyFormatter.getCurrencyFormat(value : item.multiSellPrice))",
                isTBM: false,
                type: item.type,
                isSingle: isSingleType()
            )
            .padding(.bottom)
            
        }
        .padding(.top, 16)
    }
}


struct InfoCard: View {
    public var subtitle: String
    public var bgColor: String
    public var imgIconName: String
    public var valueSingle: String
    public var valueMulti: String
    public var formulaSingle: String
    public var formulaMulti: String
    public var formulaSingleText: String
    public var formulaMultiText: String
    public var isTBM: Bool
    public var type: String
    public var isSingle: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(subtitle)
                .font(.system(.subheadline))
                .kerning(-0.8)
            Divider()
            
            VStack (alignment: .leading) {
                HStack(alignment: .center) {
                    Image(systemName: imgIconName)
                    if (isTBM){
                        if (isSingle){
                            Text("\(valueSingle)")
                                .fontWeight(.semibold)
                                .kerning(-0.5)
                        }
                        else{
                            Text("\(valueSingle) / \(valueMulti)")
                                .fontWeight(.semibold)
                                .kerning(-0.5)
                        }
                    }
                    else{
                        Text(valueSingle)
                            .fontWeight(.semibold)
                            .kerning(-0.5)
                        if (!isSingle){
                            Text("/ untuk penjualan pcs")
                                .font(.system(.footnote))
                                .opacity(0.6)
                                .kerning(-0.5)
                        }
                    }
                    
                }
//                .padding(.top, -2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 2)
                .font(.system(size: 25))
                
                
                if (!isSingle){
                    Text(formulaSingle)
                        .font(.system(.subheadline))
                    Text(formulaSingleText)
                    
                }
                else{ //Single Became Same With Multi
                    Text(formulaMulti)
                        .font(.system(.subheadline))
                    Text(formulaMultiText)
                }
                Text("= \(valueSingle)")
                    .fontWeight(.bold)
                
                
                
            }
            .font(.system(size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, isSingle ? 0 : 18)
            
            if (!isSingle){
                VStack (alignment: .leading) {
                    if (!isTBM){
                        HStack{
                            Image(systemName: imgIconName)
                            Text(valueMulti)
                                .fontWeight(.semibold)
                            Text("/ untuk penjualan \(type)")
                                .font(.system(.footnote))
                                .opacity(0.6)
                                .kerning(-0.5)
                        }
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity, alignment: .leading)
        //                .padding(.top, -2)
                        .padding(.bottom, 4)
                    }
                    
                    Text(formulaMulti)
                        .font(.system(.subheadline))
                    Text(formulaMultiText)
                    Text("= \(valueMulti)")
                        .fontWeight(.bold)
                }
                .font(.system(size: 18))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(bgColor))
        .cornerRadius(12)
    }
}

struct ResultDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//        HistoryView(selectedTab: .constant(1))
    }
}
