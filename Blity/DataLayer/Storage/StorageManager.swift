//
//  StorageManager.swift
//  Blity
//
//  Created by Eduardo Dias on 29/07/21.
//

import Combine
import Foundation
import RealmSwift

protocol Storage {
    static func store(_ object: Object)
    static func retrieve<T:Object>(object objectType: T.Type) -> Results<T>
    static func deleteAll()
}

class StorageManager: Storage {
    
    private init() {}
    
    static private let realm: Realm = try! Realm()
    
    static func store(_ object: Object) {
        
        DispatchQueue.global(qos: .background).async {
            
            let realm: Realm = try! Realm()
            
            try! realm.write {
                realm.add(object)
            }
        }
    }
    
    static func retrieve<T:Object>(object objectType: T.Type) -> Results<T> {
        realm.objects(objectType)
    }
    
    static func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
