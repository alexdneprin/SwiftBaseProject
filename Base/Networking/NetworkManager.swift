//
//  NetworkManager.swift
//  Base
//
//  Created by Alexander Slobodjanjuk on 16.09.2017.
//  Copyright © 2017 Alexander Slobodjanjuk. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: RxManager {
    
    enum RequestType: String {
        case get = "GET", post = "POST", put = "PUT", delete = "DELETE"
    }

    public enum StatusCodeType {
        case informational, successful, redirection, clientError, serverError, cancelled, unknown
    }

    static let singleton = NetworkManager(manager: SessionManager.default)
    
    override init(manager: Alamofire.SessionManager) {
        super.init(manager: manager)
    }
    
    
}

public extension Int {
    
    var statusCodeType: Networking.StatusCodeType {
        switch self {
        case URLError.cancelled.rawValue:
            return .cancelled
        case 100 ..< 200:
            return .informational
        case 200 ..< 300:
            return .successful
        case 300 ..< 400:
            return .redirection
        case 400 ..< 500:
            return .clientError
        case 500 ..< 600:
            return .serverError
        default:
            return .unknown
        }
    }
}
