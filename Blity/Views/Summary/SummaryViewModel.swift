//
//  SummaryViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 30/07/21.
//

import Foundation

class SummaryViewModel: ObservableObject {
    
    @Published
    private (set) var categoryExpenses: [CategoryExpenses] = []
    
    private var storage: Storage.Type
    
    init(_ storage: Storage.Type = StorageManager.self) {
        self.storage = storage
        loadCategoryExpenses()
    }
    
    private func loadCategoryExpenses() {
        
        let expensesStoraged = storage.retrieve(object: ExpenseObject.self).map { Expense(realmObject: $0) }
        let expensesDict = Dictionary(grouping: expensesStoraged, by: { $0.category })
        
        categoryExpenses = expensesDict.map { (category, expenses) in
            let totalSpent = expenses.reduce(0, { $0 + $1.amount.intValue })
            let categoryBudget = CategoryBudget(category: category, budget: 700)
            return CategoryExpenses(categoryBudget: categoryBudget, totalSpent: totalSpent)
        }.sorted { $0.categoryBudget.category < $1.categoryBudget.category }
    }
}
