//
//  CurrencyFormatter.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 18/08/23.
//

import Foundation

class CurrencyFormatter {
    static func getCurrencyFormat(value: Double) -> String{
        let formatter = NumberFormatter()

        return (formatter.string(from: value as NSNumber) ?? "Rp0")
    }
}
