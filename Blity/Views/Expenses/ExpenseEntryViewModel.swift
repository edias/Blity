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
    var description = ""
    
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
    
    var expense: Expense? {
        Expense(description: description, category: categorySelection, price: Double(price)!, currency: currencySelection, date: dateSelection)
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupPriceSubscription()
    }
    
    private func setupPriceSubscription() {
        Publishers.CombineLatest($price, $description).sink { [weak self] price, description in
            guard let double = Double(price) else { return }
            self?.isExpenseValid = double >= 1 && !description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }.store(in: &subscriptions)
    }
}
