//
//  ExpenseEntryViewModelTests.swift
//  BlityTests
//
//  Created by Eduardo Dias on 2/08/21.
//

import Combine
import XCTest
@testable import Blity

class ExpenseEntryViewModelTests: XCTestCase {

    private var subscriptions = Set<AnyCancellable>()
    
    func test_expenseIsNilWithoutDescription() {
        
        let vm = ExpenseEntryViewModel()
        vm.price = "5"
        
        XCTAssertNil(vm.expense)
    }
    
    func test_expenseIsNilWithPriceBelowOneDollar() {
        
        let vm = ExpenseEntryViewModel()
        vm.price = "0.1"
        vm.description = "Some description"
        
        XCTAssertNil(vm.expense)
    }
    
    func test_expenseIsNilWithEmptyDescription() {
        
        let vm = ExpenseEntryViewModel()
        vm.price = "1"
        vm.description = " "
        
        XCTAssertNil(vm.expense)
    }
    
    func test_expenseIsFilledWithViewModelData() {
        
        let today = Date()
        
        let vm = ExpenseEntryViewModel()
        vm.price = "1"
        vm.dateSelection = today
        vm.description = "Some description"
        vm.categorySelection = .healthInsurance
        vm.currencySelection = .US
        
        let expense = vm.expense
        XCTAssertEqual(expense?.amount.intValue, 1)
        XCTAssertEqual(expense?.description, "Some description")
        XCTAssertEqual(expense?.category, .healthInsurance)
        XCTAssertEqual(expense?.date, today)
    }
    
    func test_isExpenseValidIsSetToTrue() {
        
        let expectation = XCTestExpectation(description: "isExpenseValid flag is set to true with valid date ")
        
        let vm = ExpenseEntryViewModel()
        
        vm.$isExpenseValid.dropFirst(2).sink { isValid in
            XCTAssertTrue(isValid)
            expectation.fulfill()
        }.store(in: &subscriptions)
        
        vm.price = "2"
        vm.description = "Some description"
        
        wait(for: [expectation], timeout: 10)
    }
    
    func test_isExpenseValidIsSetToFalse() {
        
        let expectation = XCTestExpectation(description: "isExpenseValid flag is set to false with empty description or incorrect price.")
        
        let vm = ExpenseEntryViewModel()
        
        vm.$isExpenseValid.dropFirst(2).sink { isValid in
            XCTAssertFalse(isValid)
            expectation.fulfill()
        }.store(in: &subscriptions)
        
        vm.price = "0"
        vm.description = "Some description"
        
        wait(for: [expectation], timeout: 10)
    }


}
