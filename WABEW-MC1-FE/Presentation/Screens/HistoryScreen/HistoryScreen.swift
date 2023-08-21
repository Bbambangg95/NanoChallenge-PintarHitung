import SwiftUI


struct HistoryScreen: View{
    @EnvironmentObject var productViewModel: ProductViewModel
    @StateObject private var historyVM = HistoryViewModel()
    
    var groupedByDate: [String: [Product]] { historyVM.groupedByDate(products: productViewModel.products) }
    var sortedProducts: [String] { historyVM.sortProduct(groupedByDate: groupedByDate) }
    var body: some View{
        NavigationStack {
            VStack{
                if sortedProducts.isEmpty {
                    emptyView
                }
                else {
                    listView
                }
            }
            .navigationTitle("Riwayat")
            .background(Color("neutral5"))
            .searchable(text: $historyVM.query, prompt: "Cari riwayat")
            .onAppear(perform: {
                historyVM.tempProduct = productViewModel.products
            })
            .onChange(of: historyVM.query, perform: {
                query in
                if (query.isEmpty){
                    productViewModel.products = historyVM.tempProduct
                }
                else{
                    productViewModel.products = historyVM.tempProduct.filter{
                        $0.name.lowercased().contains(query.lowercased())
                    }
                }
            })
            .fontDesign(.rounded)
        }
    }
    private var emptyView: some View {
        VStack(alignment: .center){
            Spacer()
            Text("Belum ada riwayat yang terkumpul")
                .font(.title3)
            Button{
                //
            } label: {
                Text("Ayo Mulai Kalkulasi!")
                    .font(.headline.weight(.semibold))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
            }
            .tint(Color.secondary40)
            .foregroundColor(Color.neutral80)
            .buttonStyle(.borderedProminent)
            .cornerRadius(12)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
    private var listView: some View {
        List{
            ForEach(sortedProducts, id: \.self){ group in
                Section(header: Text(historyVM.newDateFormat(oldDate: group)).listRowInsets(EdgeInsets())){
                    ForEach(groupedByDate[group] ?? [], id: \.self){ item in
                        NavigationLink {
                            HistoryDetailView(itemDetail: item)
                        } label: {
                            HStack(alignment: .firstTextBaseline){
                                Text(item.name)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        //        HistoryView(selectedTab: .constant(1))
    }
}
