//
//  NSDate.swift
//  Base
//
//  Created by Alexander Slobodjanjuk on 16.09.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation

extension Date {
    
    func dblog() -> String {
        return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
    }
    
}
