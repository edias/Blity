//
//  ExpensesViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 28/07/21.
//

import Combine
import Foundation

class ExpensesViewModel: ObservableObject {
    
    @Published
    private (set) var emptyState: EmptyState?
    
    @Published
    private (set) var categories: [Category] = [] {
        didSet {
            emptyState = categories.isEmpty ? .expenses : nil
        }
    }
    
    private var expensesDict: [Category: [Expense]] = [:]
    
    private let storage: Storage.Type
    
    init(storage: Storage.Type = StorageManager.self) {
        self.storage = storage
        loadExpenses()
    }
        
    func addExpense(_ expense: Expense) {
        
        storage.store(expense.managedObject)
        
        if expensesDict[expense.category] == nil {
            expensesDict[expense.category] = []
            categories.append(expense.category)
            categories.sort()
        }
        
        expensesDict[expense.category]?.append(expense)
        objectWillChange.send()
    }
    
    func expensesForCategory(_ category: Category) -> [Expense] {
        expensesDict[category] ?? []
    }
    
    func loadExpenses() {
        let expenses = storage.retrieve(object: ExpenseObject.self).map { Expense(realmObject: $0) }
        let categoriesArray = expenses.map { $0.category }.sorted()
        categories = Array(Set(categoriesArray)).sorted()
        expensesDict = Dictionary(grouping: expenses, by: { $0.category })
    }
}
