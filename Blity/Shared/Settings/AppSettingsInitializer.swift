//
//  AppSettingsInitializer.swift
//  Blity
//
//  Created by Eduardo Dias on 1/08/21.
//

import Combine
import Foundation

class AppSettingsInitializer {
    
    private var cancellable: AnyCancellable?
    
    private let currencyFetcher: CurrencyFetcher
    private var settings: Settings
    
    init(currencyFetcher: CurrencyFetcher = CurrencyNetworkServices(), settings: Settings = AppSettings.shared) {
        self.currencyFetcher = currencyFetcher
        self.settings = settings
    }
    
    func initialize() {
        fetchAndStoreCurrencyRates()
        initializeDefaultCurrency()
    }
    
    private func fetchAndStoreCurrencyRates() {
        let today = Date()
        
        guard settings.quoteForDate(today) == nil else { return }

        cancellable = currencyFetcher.fetchCurrencyQuotes(date: today).sink { _ in }
            receiveValue: { [weak self] currencyQuotes in
                self?.settings.quoteWithDate = (today, currencyQuotes.quotes.USDNZD)
            }
    }
    
    func initializeDefaultCurrency() {
        guard settings.defaultCurrency == nil else { return }
        settings.defaultCurrency = .NZ
    }
}
