//
//  SummaryViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 30/07/21.
//

import Foundation

class SummaryViewModel: ObservableObject {
    
    @Published
    private (set) var totalExpenses: Amount = Amount("0.00")
    
    @Published
    private (set) var categoryExpenses: [CategoryExpenses] = []
    
    private var storage: Storage.Type
    
    init(_ storage: Storage.Type = StorageManager.self) {
        self.storage = storage
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
}

extension Date {
    var month: Int {
        let calendarDate = Calendar.current.dateComponents([.month], from: self)
        return calendarDate.month!
    }
    
    var formated: String {
        let calendarDate = Calendar.current.dateComponents([.day, .month, .year], from: self)
        return "\(calendarDate.year!)-\(calendarDate.month!)-\(calendarDate.day!)"
    }
}
