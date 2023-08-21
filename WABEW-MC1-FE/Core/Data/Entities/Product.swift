import SwiftUI

struct Product: Codable, Hashable, Identifiable{
    var id: String
    var type: String
    var name: String
    var multiItemCount: Double
    var singleItemCount: Double
    var totalBuyPrice: Double
    var multiCapital: Double
    var singleCapital: Double
    var multiSellPrice: Double
    var singleSellPrice: Double
    var itemBEP: Double
    var unitBEP: Double
    var profit: Double
    var unitProfit: Double
    var createdAt: String

    init(id: String = "0", type: String, name: String = "Item Not Found", multiItemCount: Double, singleItemCount: Double, totalBuyPrice: Double, multiCapital: Double, singleCapital: Double, multiSellPrice: Double, singleSellPrice: Double, itemBEP: Double, unitBEP: Double, profit: Double, unitProfit: Double, createdAt: String) {
        self.id = id
        self.type = type
        self.name = name
        self.multiItemCount = multiItemCount
        self.singleItemCount = singleItemCount
        self.totalBuyPrice = totalBuyPrice
        self.multiCapital = multiCapital
        self.singleCapital = singleCapital
        self.multiSellPrice = multiSellPrice
        self.singleSellPrice = singleSellPrice
        self.itemBEP = itemBEP
        self.unitBEP = unitBEP
        self.profit = profit
        self.unitProfit = unitProfit
        self.createdAt = createdAt
    }
}
