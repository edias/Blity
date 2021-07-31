//
//  Environment.swift
//  Blity
//
//  Created by Eduardo Dias on 31/07/21.
//

import Foundation

struct Environment {
    enum URLS: String {
        case base = "http://api.currencylayer.com/live?access_key=85c2ac0cdbc1c8c9281fdd30a0fb0488"
    }
}

extension Environment.URLS: CustomStringConvertible {
    var description: String { rawValue }
}
