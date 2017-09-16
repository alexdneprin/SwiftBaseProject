//
//  User.swift
//  Base
//
//  Created by Alexander Slobodjanjuk on 16.09.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import Decodable
import RealmSwift
import Opera

final class User: Object {
    
    dynamic var id: Int = Int.min
    
    let followers = List<User>()

    /**
     Return property names that should be ignored by Realm. Realm will not persist these properties.
     */
    
    override static func ignoredProperties() -> [String] {
        return []
    }
    
    convenience init(id: Int) {
        self.init()
        self.id = id
    }
}

extension User {
    
    static func decode(_ data: Any) throws -> User {
        
        return try User(id: data) // Parse data
    }
    
}
