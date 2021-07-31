//
//  NZCurrencyRate.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation

struct Quotes: Decodable {
    let USDNZD: Double
}

struct CurrencyQuotes: Decodable {
    let quotes: Quotes
}
