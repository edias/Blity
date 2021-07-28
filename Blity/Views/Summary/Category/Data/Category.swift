//
//  Category.swift
//  Blity
//
//  Created by Eduardo Dias on 25/07/21.
//

import Foundation

enum Category: String, CaseIterable {
    case carInsurance
    case carPayment
    case childcare
    case entertainment
    case food
    case gas
    case groceries
    case healthInsurance
    case hobbies
    case hollidays
    case housing
    case internet
    case mortage
    case others
    case petCare
    case petrol
    case phone
    case power
    case rent
    case sanitation
    case studentLoan
    case transportation
    case travel
    case water
    
    var titleFormatting: String { rawValue.titleCased }
    var capitalFormatting: String { rawValue.capitalisedWords }
}


extension Category {
    var iconName: String { capitalFormatting + "Icon" }
    var categoryName: String { titleFormatting }
}
