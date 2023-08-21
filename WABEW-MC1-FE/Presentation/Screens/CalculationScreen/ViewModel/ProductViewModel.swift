import Foundation

class ProductViewModel: ObservableObject  {
    @Published var products = [Product]()
    
    init(){
        fetchProducts()
    }
    
    private let productService = ProductService(productRepository: ProductJsonAdapter())
    
    func fetchProducts() {
        products = getProducts()
    }
    func createProduct(product: Product) {
        products.append(product)
        productService.updateProduct(products: products)
    }
    func getProducts() -> [Product] {
        productService.getProducs()
    }
    func searchData(query: String) -> [Product]{
        if(!query.isEmpty){
            return products.filter{
                $0.name.lowercased().contains(query.lowercased())
            }
        }else{
            return products
        }
    }
}
