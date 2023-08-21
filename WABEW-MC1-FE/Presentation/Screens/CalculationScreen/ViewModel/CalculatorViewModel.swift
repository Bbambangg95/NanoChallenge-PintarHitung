//
//  CalculatorViewModel.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 18/08/23.
//

import Foundation
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var product: Product?
    @Published var multiItemCount: String = ""
    @Published var singleItemCount: String = ""
    @Published var totalBuyPrice: String = ""
    @Published var multiSellPrice: String = ""
    @Published var singleSellPrice: String = ""
    
    @Published var selectedItemType: String = "Pcs"
    @Published var name: String = ""
    @Published var itemBEP: Double = 0.0
    @Published var unitBEP: Double = 0.0
    @Published var multiCapital: Double = 0.0
    @Published var singleCapital: Double = 0.0
    @Published var profit: Double = 0.0
    @Published var unitProfit: Double = 0.0
    
    @Published var multi_item_count: Double = 1.0
    @Published var single_item_count: Double = 1.0
    @Published var total_buy_price: Double = 0.0
    @Published var multi_sell_price: Double = 0.0
    @Published var single_sell_price: Double = 0.0
    @Published var unit_profit_size: Double = 0.0
    
    @Published var fieldAreEmpty: Bool = false
    @Published var isMultiTypeSelected: Bool = false
    @Published var showResultModal: Bool = false
    
    func createProduct() {
        if singleSellPrice.isEmpty {
            singleSellPrice = Double(autoFillSingleSellPrice()) > 0 ? String(format: "%.0f",autoFillSingleSellPrice()) : ""
            print(singleSellPrice)
        }
        fieldAreNotEmpty()
        
        if fieldAreEmpty {
            calculateAndSetState()
            fieldAreEmpty = false
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let dateString = dateFormatter.string(from: Date())
            product = Product(
                id: UUID().uuidString,
                type : selectedItemType,
                multiItemCount: multi_item_count,
                singleItemCount: single_item_count,
                totalBuyPrice: total_buy_price,
                multiCapital: multiCapital,
                singleCapital: singleCapital,
                multiSellPrice: multi_sell_price,
                singleSellPrice: single_sell_price,
                itemBEP: itemBEP,
                unitBEP: unitBEP,
                profit: profit,
                unitProfit: unitProfit,
                createdAt: dateString
            )
        } else  {
            fieldAreEmpty = true
        }
    }
    
    func resetAllField () { //reset all text field state
        name = ""
        multiItemCount = ""
        singleItemCount = ""
        totalBuyPrice = ""
        multiSellPrice = ""
        singleSellPrice = ""
    }
    
    func getDynamicMultiCapital() -> Double {
        return Double(totalBuyPrice).flatMap { multiItemCount.isEmpty ? nil : Double($0 / (Double(multiItemCount) ?? 1.0)) } ?? 0.0
    }
    func getDynamicSingleCapital() -> Double {
        return Double(totalBuyPrice).flatMap { multiItemCount.isEmpty || singleItemCount.isEmpty ? nil : Double($0 / ( (Double(multiItemCount) ?? 0.0) * (Double(singleItemCount) ?? 0.0) )) } ?? 0
    }
    func autoFillSingleSellPrice() -> Double {
        return Double(multiSellPrice).flatMap {
            singleItemCount.isEmpty ? nil : Double($0 / (Double(singleItemCount) ?? 0.0))
        } ?? 0.0
    }
    //MARK: All formula for BEP property
    func calculateAndSetState() {
        var validate_string = multiItemCount
        validate_string = validate_string.replacingOccurrences(of: ",", with: ".")
        
        multi_item_count = Double(validate_string) ?? 1.0
        single_item_count = Double(singleItemCount) ?? 1.0
        total_buy_price = Double(totalBuyPrice) ?? 0.0
        multi_sell_price = Double(multiSellPrice) ?? 0.0
        single_sell_price = Double(singleSellPrice) ?? 0.0
        
        multiCapital = total_buy_price / multi_item_count
        itemBEP = total_buy_price / multi_sell_price
        profit = (multi_item_count - itemBEP) * multi_sell_price
        
        if (isMultiTypeSelected){
            singleCapital = multiCapital / single_item_count
            unitBEP = total_buy_price / single_sell_price
            unit_profit_size = (multi_item_count * single_item_count) - Double(unitBEP)
            unitProfit = unit_profit_size * single_sell_price
        }
        else{
            single_sell_price = multi_sell_price
            singleCapital = multiCapital
            unitBEP = itemBEP
            unit_profit_size = multi_item_count - itemBEP
            unitProfit = profit
        }
    }
    
    func fieldAreNotEmpty() {
        self.fieldAreEmpty =
        isMultiTypeSelected ?
        (!multiItemCount.isEmpty && !singleItemCount.isEmpty && !totalBuyPrice.isEmpty && !multiSellPrice.isEmpty && !singleSellPrice.isEmpty)
        :
        !multiItemCount.isEmpty && !totalBuyPrice.isEmpty && !multiSellPrice.isEmpty
    }
}
