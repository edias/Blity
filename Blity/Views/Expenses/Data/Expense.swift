//
//  Expense.swift
//  Blity
//
//  Created by Eduardo Dias on 28/07/21.
//

import Foundation

struct Expense: Hashable {
    let description: String
    let category: Category
    let amount: Amount
    let currency: Currency
    let date: Date
}

extension Expense: Persistable {
    
    public init(realmObject: ExpenseObject) {
        description = realmObject.name
        category = Category(rawValue: realmObject.category)!
        amount = Amount(realmObject.value)
        currency = Currency(rawValue: realmObject.currency)!
        date = realmObject.date
    }
    
    var managedObject: ExpenseObject {
        let expenseObject = ExpenseObject()
        expenseObject.name = description
        expenseObject.category = category.rawValue
        expenseObject.value = amount.description
        expenseObject.currency = currency.rawValue
        expenseObject.date = date
        return expenseObject
    }
}
