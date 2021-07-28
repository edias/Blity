//
//  ExpensesViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 28/07/21.
//

import Foundation

class ExpensesViewModel: ObservableObject {
    
    @Published
    private (set) var categories: [Category] = []
    
    private var expenses: [Category: [Expense]] = [:]
    
    func addExpense(_ expense: Expense) {
        if expenses[expense.category] == nil {
            expenses[expense.category] = []
            categories.append(expense.category)
        }
        expenses[expense.category]?.append(expense)
        objectWillChange.send()
    }
    
    func expensesForCategory(_ category: Category) -> [Expense] {
        expenses[category] ?? []
    }
}
