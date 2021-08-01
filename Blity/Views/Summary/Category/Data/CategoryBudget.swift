//
//  CategoryBudget.swift
//  Blity
//
//  Created by Eduardo Dias on 26/07/21.
//

import Foundation

struct CategoryBudget: Hashable {
    let category: Category
    
    var name: String { category.titleFormatting }
    var iconName: String { category.iconName }
}

extension CategoryBudget {
    var budget: Int {
        switch category {
        case .carInsurance:
            return Amount("800").toSelectedCurrency.intValue
        case .carPayment:
            return Amount("1000").toSelectedCurrency.intValue
        case .childcare:
            return Amount("2000").toSelectedCurrency.intValue
        case .entertainment:
            return Amount("1000").toSelectedCurrency.intValue
        case .food:
            return Amount("2000").toSelectedCurrency.intValue
        case .gas:
            return Amount("200").toSelectedCurrency.intValue
        case .groceries:
            return Amount("1000").toSelectedCurrency.intValue
        case .healthInsurance:
            return Amount("150").toSelectedCurrency.intValue
        case .hobbies:
            return Amount("500").toSelectedCurrency.intValue
        case .hollidays:
            return Amount("2000").toSelectedCurrency.intValue
        case .housing:
            return Amount("2000").toSelectedCurrency.intValue
        case .internet:
            return Amount("200").toSelectedCurrency.intValue
        case .mortage:
            return Amount("800").toSelectedCurrency.intValue
        case .others:
            return Amount("1000").toSelectedCurrency.intValue
        case .petCare:
            return Amount("500").toSelectedCurrency.intValue
        case .petrol:
            return Amount("600").toSelectedCurrency.intValue
        case .phone:
            return Amount("100").toSelectedCurrency.intValue
        case .power:
            return Amount("200").toSelectedCurrency.intValue
        case .rent:
            return Amount("1000").toSelectedCurrency.intValue
        case .sanitation:
            return Amount("500").toSelectedCurrency.intValue
        case .studentLoan:
            return Amount("2000").toSelectedCurrency.intValue
        case .transportation:
            return Amount("200").toSelectedCurrency.intValue
        case .travel:
            return Amount("1000").toSelectedCurrency.intValue
        case .water:
            return Amount("200").toSelectedCurrency.intValue
        }
    }
}
