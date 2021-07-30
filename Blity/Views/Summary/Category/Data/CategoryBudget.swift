//
//  CategoryBudget.swift
//  Blity
//
//  Created by Eduardo Dias on 26/07/21.
//

import Foundation

struct CategoryBudget: Hashable {
    let category: Category
    let budget: Int
    
    var name: String { category.titleFormatting }
    var iconName: String { category.iconName }
}
