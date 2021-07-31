//
//  BlityApp.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import Combine
import SwiftUI

@main
struct BlityApp: App {
    
    private var cancellable: AnyCancellable?
    
    private let currencyFetcher: CurrencyFetcher = CurrencyNetworkServices()
    
    init() {
        
        let today = Date()
        
        guard CurrencyStorageSettings.shared.quoteForDate(today) == nil else { return }
        
        cancellable = currencyFetcher.fetchCurrencyQuotes(date: today).sink { _ in }
            receiveValue: { currencyQuotes in
                CurrencyStorageSettings.shared.storeQuote(withDate: today, quote: currencyQuotes.quotes.USDNZD)
            }
    }
    
    var body: some Scene {
        WindowGroup {
            SummaryView()
        }
    }
}
