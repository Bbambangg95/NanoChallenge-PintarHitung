//
//  ProductJsonAdapter.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import Foundation

class ProductJsonAdapter: ProductRepository {
    func updateProducts(products: [Product]) {
        do {
            let jsonURL = URL.documentsDirectory.appending(path: "ProductsHistory.json")
            let parentsData = try JSONEncoder().encode(products)
            try parentsData.write(to: jsonURL)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    func getProducts() -> [Product] {
        var products = [Product]()
        let jsonURL = URL.documentsDirectory.appendingPathComponent("ProductsHistory.json")
        print(jsonURL.path)
        if FileManager().fileExists(atPath: jsonURL.path) {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                products = try JSONDecoder().decode([Product].self, from: jsonData)
            } catch {
                print(error.localizedDescription)
            }
        }
        return products
    }
}
