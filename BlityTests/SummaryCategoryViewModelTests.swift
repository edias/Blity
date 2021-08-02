//
//  SummaryCategoryViewModelTests.swift
//  BlityTests
//
//  Created by Eduardo Dias on 2/08/21.
//

import XCTest
@testable import Blity

class SummaryCategoryViewModelTests: XCTestCase {


    func test_summaryCategoryViewModelOutputPropertiesCorrectly() {
        
        let budget = CategoryBudget(category: .groceries)
        let expenses = CategoryExpenses(categoryBudget: budget, totalSpent: 200)
        let vm = SummaryCategoryViewModel(expenses: expenses)
        
        XCTAssertEqual(vm.categoryName, "Groceries")
        XCTAssertEqual(vm.categoryIcon, "GroceriesIcon")
        XCTAssertEqual(vm.budget, 1000)
        XCTAssertEqual(vm.totalSpent, 200)
    }
    
    func test_summaryCategoryViewModelOutputOnTrackingMessage() {
        
        let budget = CategoryBudget(category: .groceries)
        let expenses = CategoryExpenses(categoryBudget: budget, totalSpent: 200)
        let vm = SummaryCategoryViewModel(expenses: expenses)
        
        
        XCTAssertEqual(vm.tracking.icon, "CheckIcon")
        XCTAssertEqual(vm.tracking.message, "Your groceries spending is still on track")
    }
    
    func test_summaryCategoryViewModelOutputWarningTrackingMessage() {
        
        let budget = CategoryBudget(category: .groceries)
        let expenses = CategoryExpenses(categoryBudget: budget, totalSpent: 780)
        let vm = SummaryCategoryViewModel(expenses: expenses)
        
        
        XCTAssertEqual(vm.tracking.icon, "WarningIcon")
        XCTAssertEqual(vm.tracking.message, "You are almost exceeding your budget")
    }
    
    func test_summaryCategoryViewModelOutputHighWarningTrackingMessage() {
        
        let budget = CategoryBudget(category: .groceries)
        let expenses = CategoryExpenses(categoryBudget: budget, totalSpent: 850)
        let vm = SummaryCategoryViewModel(expenses: expenses)
        
        
        XCTAssertEqual(vm.tracking.icon, "WarningIcon")
        XCTAssertEqual(vm.tracking.message, "You are very close to reach your budget")
    }

    func test_summaryCategoryViewModelOutputErrorTrackingMessage() {
        
        let budget = CategoryBudget(category: .groceries)
        let expenses = CategoryExpenses(categoryBudget: budget, totalSpent: 1000)
        let vm = SummaryCategoryViewModel(expenses: expenses)
        
        
        XCTAssertEqual(vm.tracking.icon, "ErrorIcon")
        XCTAssertEqual(vm.tracking.message, "You excedded your budget")
    }
}
