//
//  HistoryViewModel.swift
//  WABEW-MC1-FE
//
//  Created by Bambang Ardiyansyah on 21/08/23.
//

import Foundation

class HistoryViewModel: ObservableObject {
    @Published var tempProduct: [Product] = []
    @Published var query: String = ""
    
    private let changeDateFormat = DateFormatter()
    private let dateFormatter = DateFormatter()
    
    func newDateFormat(oldDate: String) -> String{
        changeDateFormat.locale = Locale(identifier: "id_id")
        changeDateFormat.dateFormat = "EEEE, dd MMMM yyyy"
        let inputDate = dateFormatter.date(from: oldDate)
        let outputDate = changeDateFormat.string(from: inputDate ?? Date())

        return outputDate
    }
    func date(from string: String, format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.date(from: string)
    }
    func groupedByDate(products: [Product]) -> [String: [Product]] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id_ID")
        dateFormatter.dateFormat = "dd MMMM yyyy" //ubah format tanggal
        //            dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        
        let dict = Dictionary(grouping: products, by: {
            let date = date(from: $0.createdAt)
            return dateFormatter.string(from: date ?? Date())
        })
        
        return Dictionary(uniqueKeysWithValues: dict.map {
            key, value in (key, value.sorted {$0.createdAt > $1.createdAt}) //ubah urutan
        })
    }
    func sortProduct(groupedByDate: [String: [Product]] ) -> [String] {
        groupedByDate.map({$0.key }).sorted(by: >)
    }
}
