//
//  CategoryExpenses.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import Foundation

struct CategoryExpenses: Hashable {
    let categoryBudget: CategoryBudget
    let totalSpent: Int
    
    var name: String { categoryBudget.name }
    var iconName: String { categoryBudget.iconName }
    var budget: Int { categoryBudget.budget }
}
