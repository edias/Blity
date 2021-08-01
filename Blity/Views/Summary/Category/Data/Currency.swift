//
//  Currency.swift
//  Blity
//
//  Created by Eduardo Dias on 27/07/21.
//

import Foundation

enum Currency: String, CaseIterable {
    case NZ
    case US
    
    var displayName: String { rawValue }
}

extension Currency {
    var iconName: String {
        "\(rawValue)FlagIcon"
    }
}
