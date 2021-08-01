//
//  SummaryViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 30/07/21.
//

import Combine
import Foundation

class SummaryViewModel: ObservableObject {
    
    @Published
    private (set) var totalExpenses: Amount = Amount("0.00")
    
    @Published
    private (set) var categoryExpenses: [CategoryExpenses] = []
    
    @Published
    var defaultCurrency: Currency?
    
    private var cancellable: AnyCancellable?
    
    private let storage: Storage.Type
    
    private var settings: Settings
    
    init(_ storage: Storage.Type = StorageManager.self, settings: Settings = AppSettings.shared) {
        self.storage = storage
        self.settings = settings
        self.defaultCurrency = settings.defaultCurrency
        setupCurrencySubscription()
    }
    
    func loadCategoryExpenses() {
        
        let expensesDict = Dictionary(grouping: monthExpenses, by: { $0.category })
        
        categoryExpenses = expensesDict.map { (category, expenses) in
            let totalSpent = expenses.reduce(0, { $0 + $1.amount.intValue })
            let budget = Int.random(in: 100..<1000)
            let categoryBudget = CategoryBudget(category: category, budget: budget)
            return CategoryExpenses(categoryBudget: categoryBudget, totalSpent: totalSpent)
        }.sorted { $0.categoryBudget.category < $1.categoryBudget.category }
        
        let total = categoryExpenses.reduce(0, { $0 + $1.totalSpent })
        totalExpenses = Amount("\(total)")
    }
    
    private var monthExpenses: [Expense] {
        let today = Date()
        return storage.retrieve(object: ExpenseObject.self)
            .filter { $0.date.month == today.month }
            .map { Expense(realmObject: $0) }
    }
    
    private func setupCurrencySubscription() {
        cancellable = $defaultCurrency.sink { _ in }
            receiveValue: { [weak self] currency in
                self?.settings.defaultCurrency = currency
            }
    }
}

extension Date {
    var month: Int {
        let calendarDate = Calendar.current.dateComponents([.month], from: self)
        return calendarDate.month!
    }
    
    var formatted: String {
        let calendarDate = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return "\(calendarDate.year!)-\(calendarDate.month!)-\(calendarDate.day!)"
    }
}
