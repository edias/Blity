//
//  ExpenseEntryViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 27/07/21.
//

import Combine
import Foundation

class ExpenseEntryViewModel: ObservableObject {
    
    let categories = Category.allCases
    
    let currencies = Currency.allCases
    
    @Published
    var categorySelection: Category = .food
    
    @Published
    var price = "0.00"
    
    @Published
    var currencySelection: Currency = .NZ
    
    @Published
    var dateSelection = Date()
    
    @Published
    var isExpenseValid = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupPriceSubscription()
    }
    
    private func setupPriceSubscription() {
        $price.sink { _ in }
            receiveValue: { [weak self] price in
                guard let double = Double(price) else { return }
                self?.isExpenseValid = double >= 1
        }.store(in: &subscriptions)
    }
}
