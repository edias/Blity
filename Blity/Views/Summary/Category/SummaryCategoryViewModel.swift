//
//  SummaryCategoryViewModel.swift
//  Blity
//
//  Created by Eduardo Dias on 26/07/21.
//

import Foundation

struct SummaryCategoryViewModel {
    
    private let expenses: CategoryExpenses
    
    var categoryName: String { expenses.name }
    var categoryIcon: String { expenses.iconName }
    var budget: Int { expenses.budget }
    var totalSpent: Int { expenses.totalSpent }
    
    init(expenses: CategoryExpenses) {
        self.expenses = expenses
    }
    
    var tracking: (message: String, icon: String) {
        
        let percentageSpent =  100 * expenses.totalSpent / expenses.budget
        
        switch percentageSpent {
            case (0...77):
                return (message: "Your \(categoryName.lowercased()) spending is still on track", icon: "CheckIcon")
            case (78...82):
                return (message:"You are almost exceeding your budget", icon: "WarningIcon")
            case (83...99):
                return (message: "You are very close to reach your budget", icon: "WarningIcon")
            default:
                return (message: "You excedded your budget", icon: "ErrorIcon")
        }
    }
}
