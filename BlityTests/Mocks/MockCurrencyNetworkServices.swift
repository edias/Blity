//
//  MockCurrencyNetworkServices.swift
//  BlityTests
//
//  Created by Eduardo Dias on 02/08/21.
//

import Combine
import Foundation
@testable import Blity

class MockCurrencyNetworkServices: CurrencyNetworkServices {
    var jsonString: String = ""
    var statusCode: Int = 200
    override var restClient: RestClient {
        MockRestClient(jsonString: jsonString, statusCode: statusCode)
        
    }
}
