//
//  CurrencyViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 2/08/21.
//

import Combine

class CurrencyViewModel: ObservableObject {
    
    @Published
    var selectedCurrency: Currency
    
    private var settings: Settings
    
    private var cancellable: AnyCancellable?
    
    init(settings: Settings = AppSettings.shared) {
        self.settings = settings
        self.selectedCurrency = settings.selectedCurrency
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        cancellable = $selectedCurrency.dropFirst().sink { [weak self] currency in
            self?.settings.selectedCurrency = currency
        }
    }
}
