//
//  ExpenseObject.swift
//  Blity
//
//  Created by Eduardo Dias on 29/07/21.
//

import Foundation
import RealmSwift

final class ExpenseObject: Object {
    
    dynamic var identifier = 0
    
    @Persisted
    var name: String
    
    @Persisted
    var category: String
    
    @Persisted
    var value: String
    
    @Persisted
    var currency: String
    
    @Persisted
    var date: Date
}
