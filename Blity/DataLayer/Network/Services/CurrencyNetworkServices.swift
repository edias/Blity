//
//  CurrencyNetworkServices.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation
import Combine

protocol CurrencyRateFetcher {
    func fetchNZCurrencyRate(date: Date) -> AnyPublisher<NZCurrencyRate, Error>
}

class CurrencyNetworkServices: BaseNetworkServices, CurrencyRateFetcher {
    
    func fetchNZCurrencyRate(date: Date = Date()) -> AnyPublisher<NZCurrencyRate, Error> {
        get(urlString: "\(Environment.URLS.base)&from=USD&to=NZD&amount=1&format=1&date=\(date.formated)")
    }
}
