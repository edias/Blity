//
//  BlityNetworkServicesTests.swift
//  BlityTests
//
//  Created by Eduardo Dias on 02/08/21.
//


import Combine
import XCTest
@testable import Blity

class BlityNetworkServicesTests: XCTestCase {
    
    private var susbcriptions = Set<AnyCancellable>()

    private var mockCurrencyNetworkServices: MockCurrencyNetworkServices!
    
    override func setUp() {
        mockCurrencyNetworkServices = MockCurrencyNetworkServices()
    }
    
    func test_currencyQuotesReturnsSuccessfully() {
        
        mockCurrencyNetworkServices.jsonString = """
        {
            "quotes": {"USDNZD": 1.428965}
        }
        """
        
        let expectation = XCTestExpectation(description: "Currency quotes returns successfully")
        
        mockCurrencyNetworkServices.fetchCurrencyQuotes(date: Date()).sink { _ in } receiveValue: { currencyQuotes in
            XCTAssertNotNil(currencyQuotes.quotes)
            XCTAssertEqual(currencyQuotes.quotes.USDNZD, 1.428965)
            expectation.fulfill()
        }.store(in: &susbcriptions)
        
        wait(for: [expectation], timeout: 10)
    }
    

    func test_currencyQuotesReturnsFailWithMalformedData() {
        
        mockCurrencyNetworkServices.jsonString = """
        {
           "quotes": {"USDNZD: 1.428965}
        }
        """
        
        let expectation = XCTestExpectation(description: "Currency quotes don't return due to serialization issue with malformed data")
        
        mockCurrencyNetworkServices.fetchCurrencyQuotes(date: Date()).sink { error in
            switch error {
                case .failure(let error) where error is DecodingError:
                    expectation.fulfill()
                default: break
            }
            
        } receiveValue: { _ in }.store(in: &susbcriptions)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_currencyQuotesReturnsFailWithEmptyData() {
        
        mockCurrencyNetworkServices.jsonString = ""
        
        let expectation = XCTestExpectation(description: "Currency quotes don't return due to serialization issue with empty data")
        
        mockCurrencyNetworkServices.fetchCurrencyQuotes(date: Date()).sink { error in
            switch error {
                case .failure(let error) where error is DecodingError:
                    expectation.fulfill()
                default: break
            }
            
        } receiveValue: { _ in }.store(in: &susbcriptions)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_currencyQuotesReturnsFailWithErrorStatusCode() {
        
        mockCurrencyNetworkServices.jsonString = """
        {
           "quotes": {"USDNZD: 1.428965}
        }
        """
        
        mockCurrencyNetworkServices.statusCode = 500
        
        let expectation = XCTestExpectation(description: "Currency quotes don't return due to error status code")
        
        mockCurrencyNetworkServices.fetchCurrencyQuotes(date: Date()).sink { error in
            switch error {
                case .failure(let error as StatusCodeError) where error == StatusCodeError.internalServerError:
                    expectation.fulfill()
                default: break
            }
            
        } receiveValue: { _ in }.store(in: &susbcriptions)
        
        wait(for: [expectation], timeout: 1)
    }
    
    func test_currencyQuotesReturnsFailWithRateLimitError() {
        
        mockCurrencyNetworkServices.jsonString = """
        {
           "quotes": {"USDNZD: 1.428965}
        }
        """
        
        mockCurrencyNetworkServices.statusCode = 429
        
        let expectation = XCTestExpectation(description: "Currency quotes don't return due to reached limit requests")
        
        mockCurrencyNetworkServices.fetchCurrencyQuotes(date: Date()).sink { error in
            switch error {
                case .failure(let error as StatusCodeError) where error == StatusCodeError.tooManyRequests:
                    expectation.fulfill()
                default: break
            }
            
        } receiveValue: { _ in }.store(in: &susbcriptions)
        
        wait(for: [expectation], timeout: 1)
    }
}
