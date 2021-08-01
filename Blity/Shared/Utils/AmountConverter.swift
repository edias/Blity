//
//  AmountConverter.swift
//  Blity
//
//  Created by Eduardo Dias on 1/08/21.
//

import Foundation

class AmountConverter {
    
    static var settings: Settings = AppSettings.shared
        
    static func convertToSelectedCurrency(_ amount: Amount) -> Amount {
        guard amount.currency != settings.selectedCurrency else { return amount }
        guard let rate = settings.quoteForDate(Date()) else { return amount }
        let convertedValue = amount.currency == .NZ ? amount.doubleValue / rate : amount.doubleValue * rate
        return Amount("\(convertedValue)")
    }
}
