//
//  CurrencyStorageSettings.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation

protocol CurrencyStorage {
    func storeQuote(withDate date: Date, quote: Double) -> Void
    func quoteForDate(_ date: Date) -> Double?
}

class CurrencyStorageSettings: CurrencyStorage {
    
    private enum StoringKey: String {
        case quote
    }
    
    private let userDefaults: UserDefaults
    
    static let shared = CurrencyStorageSettings()
    
    private init() {
        userDefaults = UserDefaults()
    }
    
    func storeQuote(withDate date: Date, quote: Double) {
        
        guard quoteForDate(date) == nil else { return }
        
        let dateString = date.formatted
        
        if var dict = storedDict {
            dict[dateString] = quote
            userDefaults.setValue(dict, forKey: StoringKey.quote.rawValue)
        } else {
            userDefaults.setValue([dateString: quote], forKey: StoringKey.quote.rawValue)
        }
    }
    
    func quoteForDate(_ date: Date) -> Double? {
        guard let dict = storedDict else { return nil }
        return dict[date.formatted]
    }
    
    private var storedDict: [String: Double]? {
        userDefaults.dictionary(forKey: StoringKey.quote.rawValue) as? [String: Double]
    }
}
