//
//  CurrencyViewModelTests.swift
//  BlityTests
//
//  Created by Eduardo Dias on 2/08/21.
//

import Combine
import XCTest
@testable import Blity

class CurrencyViewModelTests: XCTestCase {

    private var susbcriptions = Set<AnyCancellable>()

    private var mockSettings: MockSettings!
    
    override func setUp() {
        mockSettings = MockSettings()
    }
    
    func test_allSettingsIsUpdatedwithViewModelSelectedCurrency() {
        
        
        let expectation = XCTestExpectation(description: "Astronauts are populated after loaded succesfully")
        
        let vm = CurrencyViewModel(settings: mockSettings)
        
        mockSettings.selectedCurrencyCompletion = { currency in
            XCTAssertEqual(currency, .US)
            expectation.fulfill()
        }
        
        vm.selectedCurrency = .US
        
        wait(for: [expectation], timeout: 1)
    }

}

typealias SelectedCurrencyCompletion = (Currency) -> Void

private final class MockSettings: Settings {
    
    var selectedCurrencyCompletion: SelectedCurrencyCompletion?
    
    var selectedCurrency: Currency = .NZ {
        didSet {
            selectedCurrencyCompletion?(selectedCurrency)
        }
    }
    
    var quoteWithDate: (date: Date, quote: Double)?
    
    func quoteForDate(_ date: Date) -> Double? {
        nil
    }
    
    init(selectedCurrencyCompletion: SelectedCurrencyCompletion? = nil) {
        self.selectedCurrencyCompletion = selectedCurrencyCompletion
    }
}
