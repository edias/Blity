//
//  AmountFormatter.swift
//  Blity
//
//  Created by Eduardo Dias on 29/07/21.
//

import Foundation

class AmountFormatter {
    
    private static var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.positivePrefix = "$"
        return formatter
    }()
    
    static func stringFromAmount(_ amount: Amount, currency: Currency? = nil) -> String {
        if let currency = currency {
            formatter.positivePrefix = "$\(currency.rawValue) "
        } else {
            formatter.positivePrefix = "$"
        }
        return formatter.string(from: amount.value) ?? ""
    }
}
