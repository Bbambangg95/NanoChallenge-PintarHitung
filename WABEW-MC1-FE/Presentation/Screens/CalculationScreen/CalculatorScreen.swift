import SwiftUI

struct CalculatorScreen: View {
    @EnvironmentObject var productVM: ProductViewModel
    @StateObject private var calculatorVM = CalculatorViewModel()
    @State var isNavigateToDetail : Bool = false
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false){
                VStack (alignment: .leading) {
                    ProductNameTextField(
                        productName: $calculatorVM.name,
                        placeHolder: "Kalkulasi \(productVM.products.count + 1)")
                    ItemTextField(
                        multiItemCount: $calculatorVM.multiItemCount,
                        singleItemCount: $calculatorVM.singleItemCount,
                        selectedItemType: $calculatorVM.selectedItemType,
                        isMultiTypeSelected: $calculatorVM.isMultiTypeSelected)
                    BuyPriceTextField(totalBuyPrice: $calculatorVM.totalBuyPrice)
                    if !calculatorVM.totalBuyPrice.isEmpty {
                        PricePreview(type: calculatorVM.selectedItemType, value: calculatorVM.getDynamicMultiCapital())
                    }
                    MultiSellPriceTextField(
                        multiSellPrice: $calculatorVM.multiSellPrice,
                        selectedItemType: $calculatorVM.selectedItemType)
                    if calculatorVM.isMultiTypeSelected && !calculatorVM.totalBuyPrice.isEmpty {
                        PricePreview(type: "Pcs", value: calculatorVM.getDynamicSingleCapital())
                    }
                    if calculatorVM.isMultiTypeSelected {
                        SingleSellPriceTextField(
                            singleSellPrice: $calculatorVM.singleSellPrice,
                            placeholder: Double(calculatorVM.autoFillSingleSellPrice()) > 0 ? "\(String(format: "%.0f" ,calculatorVM.autoFillSingleSellPrice()))" : "0")
                    }
                    ButtonView(label: "Reset", isOutlined: true) {
                        calculatorVM.resetAllField()
                        calculatorVM.fieldAreEmpty = false
                    }
                    .padding(.top, 30)
                    ButtonView(label: "Kalkulasi") {
                        calculatorVM.createProduct()
                        var newProduct = calculatorVM.product
                        newProduct?.name = calculatorVM.name.isEmpty ? "Kalkulasi \(productVM.products.count + 1)" : calculatorVM.name
                        if let product = newProduct {
                            productVM.createProduct(product: product)
                            calculatorVM.showResultModal = true
                        }
                    }
                    if(calculatorVM.product != nil){
                        NavigationLink(destination: HistoryDetailView(itemDetail: calculatorVM.product!), isActive: $isNavigateToDetail) {}
                    }
                }
                .padding(20)
                .navigationTitle("Kalkulator")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .sheet(isPresented: $calculatorVM.showResultModal) {
                ResultModal(
                    //                    id: calculatorVM.product!.id,
                    calculatorVM: calculatorVM,
                    isNavigateToDetail : $isNavigateToDetail
                )
            }
            .background(Color.neutral5)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    }
                }
            }
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
            )
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
