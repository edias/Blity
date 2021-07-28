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
    
    var formattedValue: String { AmountFormatter.stringFromValue(value) }
    
    var intValue: Int { Int(truncating: value) }
    
    init(_ string: String, currency: Currency = .NZ) {
        self.value = NSDecimalNumber(string: string)
        self.currency = currency
    }
}
