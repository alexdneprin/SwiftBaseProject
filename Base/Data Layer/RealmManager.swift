//
//  RealmManager.swift
//  Base
//
//  Created by Alexander Slobodjanjuk on 16.09.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmManager: AnyObject {
    
    static let sharedInstance = RealmManager()
    
    fileprivate(set) var defaultRealm: Realm!
    
    fileprivate var config = Realm.Configuration()
    
    fileprivate init() {

    }
    
    func eraseAll() {
        do {
            let realm = try createRealm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            let nserror = error as NSError
        }
    }
    
    func createRealm() throws -> Realm {
        return try Realm(configuration: config)
    }
    
}

extension Object {
    
    fileprivate func realmInst() -> Realm {
        return self.realm ?? RealmManager.sharedInstance.defaultRealm
    }
    
    /** Must be called from main thread */
    func save(_ update: Bool = true) throws {
        let realm = self.realmInst()
        try realm.write() {
            realm.add(self, update: update)
        }
    }
    
    /** Must be called from main thread */
    static func save(_ objects: [Object], update: Bool = true) throws {
        guard let first = objects.first else {
            return
        }
        let realm = first.realmInst()
        try realm.write() {
            objects.forEach() { realm.add($0, update: update) }
        }
    }
    
}
