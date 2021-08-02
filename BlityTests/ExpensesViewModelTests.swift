//
//  ExpensesViewModelTests.swift
//  BlityTests
//
//  Created by Eduardo Dias on 3/08/21.
//

import RealmSwift
import XCTest
@testable import Blity

class ExpensesViewModelTests: XCTestCase {

    func test_expenseIsStoredWhenAddedOnViewModel() {
        
        let expectation = XCTestExpectation(description: "Expense is stored when added to View Model")
        
        let expense = Expense(description: "Cinema",
                              category: .entertainment,
                              amount: Amount("10"),
                              date: Date())
        
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        mockStorage.objectWasStored = { object in
            expectation.fulfill()
        }
        vm.addExpense(expense)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_expenseCategoryIsAddedToTheList() {
        
        let expense = Expense(description: "Cinema",
                              category: .entertainment,
                              amount: Amount("100"),
                              date: Date())
        
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        vm.addExpense(expense)
        
        XCTAssertTrue(vm.categories.contains(.entertainment))
    }
    
    func test_theSameCategoryCanOnlyBeAddedOnce() {
        
        let expense1 = Expense(description: "Cinema",
                              category: .entertainment,
                               amount: Amount("10"),
                               date: Date())
        
        let expense2 = Expense(description: "Jazz Festival",
                               category: .entertainment,
                               amount: Amount("100"),
                               date: Date())
        
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        vm.addExpense(expense1)
        vm.addExpense(expense2)
        
        XCTAssertEqual(vm.categories.count, 1)
    }
    
    func test_multipleDifferentCategorieCanBeAdded() {
        
        let expense1 = Expense(description: "Cinema",
                              category: .entertainment,
                               amount: Amount("10"),
                               date: Date())
        
        let expense2 = Expense(description: "MacDonalds",
                               category: .food,
                               amount: Amount("20"),
                               date: Date())
        
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        vm.addExpense(expense1)
        vm.addExpense(expense2)
        
        XCTAssertEqual(vm.categories.count, 2)
        XCTAssertEqual(vm.categories.first, .entertainment)
        XCTAssertEqual(vm.categories[1], .food)
    }
    
    func test_expensesCanBeRetrivedByCategory() {
        
        let expense1 = Expense(description: "Cinema",
                              category: .entertainment,
                               amount: Amount("10"),
                               date: Date())
        
        let expense2 = Expense(description: "Jazz Festival",
                               category: .entertainment,
                               amount: Amount("100"),
                               date: Date())
        
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        vm.addExpense(expense1)
        vm.addExpense(expense2)
        
        XCTAssertEqual(vm.expensesForCategory(.entertainment).first?.description, "Cinema")
        XCTAssertEqual(vm.expensesForCategory(.entertainment)[1].description, "Jazz Festival")
    }
    
    func test_expensesAreEmptyWhenCategoryDoNotExist() {
        
        let expense = Expense(description: "Cinema",
                              category: .entertainment,
                              amount: Amount("10"),
                              date: Date())
                
        let mockStorage = MockStorage.self
        let vm = ExpensesViewModel(storage: mockStorage)
        vm.addExpense(expense)
        
        XCTAssertTrue(vm.expensesForCategory(.carPayment).isEmpty)
    }
}


private final class MockStorage: Storage {
    
    static var objectWasStored: ((Object) -> Void)?
    
    static func store(_ object: Object) {
        objectWasStored?(object)
    }
    
    static func retrieve<T>(object objectType: T.Type) -> Results<T> where T : Object {
        
        return try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "test")).objects(T.self)
    }
    
    static func deleteAll() {
        
    }
}
