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
    
    static func stringFromAmount(_ amount: Amount) -> String {
        formatter.string(from: amount.value) ?? ""
    }
}
