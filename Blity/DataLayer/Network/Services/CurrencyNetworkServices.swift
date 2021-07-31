//
//  CurrencyNetworkServices.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation
import Combine

protocol CurrencyFetcher {
    func fetchCurrencyQuotes(date: Date) -> AnyPublisher<CurrencyQuotes, Error>
}

class CurrencyNetworkServices: BaseNetworkServices, CurrencyFetcher {
    
    func fetchCurrencyQuotes(date: Date) -> AnyPublisher<CurrencyQuotes, Error> {
        get(urlString: "\(Environment.URLS.base)&from=USD&to=NZD&amount=1&format=1&date=\(date.formated)")
    }
}
