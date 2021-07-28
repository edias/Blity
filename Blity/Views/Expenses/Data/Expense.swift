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
    let price: Double
    let currency: Currency
    let date: Date
}
