//
//  Amount.swift
//  Blity
//
//  Created by Eduardo Dias on 29/07/21.
//

import Foundation

struct Amount: Hashable, CustomStringConvertible {
    
    var description: String { "\(value)" }
    
    var currency: Currency = .NZ
    
    var value: NSDecimalNumber
    
    var intValue: Int { Int(truncating: value) }
    
    var doubleValue: Double { Double(truncating: value) }
    
    init(_ string: String, currency: Currency = .NZ) {
        self.value = NSDecimalNumber(string: string)
        self.currency = currency
    }
}

extension Amount {
    var formattedValue: String { AmountFormatter.stringFromAmount(self) }
    var formattedValueWithCurrency: String { AmountFormatter.stringFromAmount(self, currency: currency) }
    var toSelectedCurrency: Amount { AmountConverter.convertToSelectedCurrency(self) }
}
