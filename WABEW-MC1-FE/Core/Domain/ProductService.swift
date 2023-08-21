//
//  ProductService.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import Foundation

class ProductService {
    private let productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
    }
    
    func updateProduct(products: [Product]) {
        return productRepository.updateProducts(products: products)
    }
    func getProducs() -> [Product] {
        return productRepository.getProducts()
    }
}
