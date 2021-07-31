//
//  CurrencyStorageSettings.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation

protocol Settings {
    var quoteWithDate: (date: Date, quote: Double)? { get set }
    func quoteForDate(_ date: Date) -> Double?
}

class AppSettings: Settings {
    
    private enum StoringKey: String {
        case quote
    }
    
    private let userDefaults: UserDefaults
    
    static let shared = AppSettings()
    
    private init() {
        userDefaults = UserDefaults()
    }
    
    var quoteWithDate: (date: Date, quote: Double)? {
        
       didSet {
            
            guard let newValue = quoteWithDate else { return }
            
            let (date, quote) = newValue
            
            let dateString = date.formatted
            
            if var dict = storedDict {
                dict[dateString] = quote
                userDefaults.setValue(dict, forKey: StoringKey.quote.rawValue)
            } else {
                userDefaults.setValue([dateString: quote], forKey: StoringKey.quote.rawValue)
            }
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
