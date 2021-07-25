//
//  CategoryExpenses.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import Foundation

struct CategoryExpenses {
    
    var category: Category
    var totalSpent: Int
    
    var categoryName: String { category.name }
    var categoryIcon: String { category.icon }
    var categoryBudget: Int { category.budget }
}
