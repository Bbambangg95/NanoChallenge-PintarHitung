//
//  Repository.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 19/08/23.
//

import Foundation

protocol ProductRepository {
    func updateProducts(products: [Product])
    func getProducts() -> [Product]
}
