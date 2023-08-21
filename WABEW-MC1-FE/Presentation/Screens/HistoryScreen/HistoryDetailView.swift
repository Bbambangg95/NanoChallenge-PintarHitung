import SwiftUI

struct HistoryDetailView: View {
    public var item: Product
    let formatter = NumberFormatter()

    init(itemDetail: Product){
        self.item = itemDetail
    }
    
    func isSingleType() -> Bool{
        return (item.type == "Kg" || item.type == "Pcs")
    }

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                if (isSingleType()){
                    ItemCard(
                        iconBgColor: Color.danger40,
                        imgIconName: "shippingbox.fill",
                        labelText: "Jumlah \(item.type)",
                        valueText: "\(String(format: "%.2f", item.multiItemCount))"
                    )
                    .padding(.top, 24)
                }
                else{
                    HStack(){
                        ItemCard(
                            iconBgColor: Color.danger40,
                            imgIconName: "shippingbox.fill",
                            labelText: "Jumlah \(item.type)",
                            valueText: "\(String(format: "%.0f", item.multiItemCount))",
                            width: 195
                        )
                        HStack(alignment: .center){
                            VStack(alignment: .leading){
                                Text("Pcs per \(item.type)")
                                    .font(.system(.subheadline))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("\(String(format: "%.0f", item.singleItemCount))")
                                    .font(.system(.title, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(12)
                        .frame(maxWidth: 145, maxHeight: 72)
                        .background(.white)
                        .cornerRadius(12)
                    }
                    .padding(.top, 24)
                }
                
                ItemCard(
                    iconBgColor: Color.primarySpecial,
                    iconColor: Color.white,
                    imgIconName: "dollarsign.circle.fill",
                    labelText: "Harga Beli Total",
                    valueText: formatter.string(from: item.totalBuyPrice as NSNumber) ?? "Rp0"
                )
                
                Text("Modal / \(item.type): __\(formatter.string(from: (isSingleType() ? item.singleCapital : item.multiCapital) as NSNumber) ?? "0")__")
                    .font(.system(.title3))
                    .padding(10)
                    .background(Color.secondary10)
                    .cornerRadius(12)
                    .padding(.top, 16)
                
                ItemCard(
                    iconBgColor: Color.success60,
                    imgIconName: "tag.circle.fill",
                    labelText: "Harga Jual per \(item.type)",
                    valueText: formatter.string(from: (isSingleType() ? item.singleSellPrice : item.multiSellPrice) as NSNumber) ?? "0"
                )
                
                if (!isSingleType()){
                    Text("Modal / Pcs: __\(formatter.string(from: item.singleCapital as NSNumber) ?? "0")__")
                        .font(.system(.title3))
                        .padding(10)
                        .background(Color.secondary10)
                        .cornerRadius(12)
                        .padding(.top, 16)
                    
                    ItemCard(
                        iconBgColor: Color.success60,
                        imgIconName: "tag.circle.fill",
                        labelText: "Harga Jual per Pcs",
                        valueText: formatter.string(from: item.singleSellPrice as NSNumber) ?? "0"
                    )
                }
                
                Divider()
                    .padding(.top)
                
                ResultDetailView(item: item)
            }
        }
        .padding(.horizontal, 24)
        .background(Color.neutral5)
        .navigationTitle("\(item.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
