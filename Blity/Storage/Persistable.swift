//
//  Persistable.swift
//  Blity
//
//  Created by Eduardo Dias on 29/07/21.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype RealmObject: RealmSwift.Object
    init(realmObject: RealmObject)
    var managedObject: RealmObject { get }
}
