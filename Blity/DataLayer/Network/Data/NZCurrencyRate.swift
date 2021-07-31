//
//  NZCurrencyRate.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation

struct NZRate: Decodable {
    let USDNZD: Double
}

struct NZCurrencyRate: Decodable {
    let rate: NZRate
}
