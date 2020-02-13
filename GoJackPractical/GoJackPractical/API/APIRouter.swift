//
//  APIRouter.swift
//  GoJackPractical
//
//  Created by admin on 12/02/20.
//  Copyright © 2020 anshul shah. All rights reserved.
//

import Foundation

protocol Requestable {
    func asURLRequest() -> URLRequest?
}

enum APIRouter: Requestable{
    case getContacts
    
    func asURLRequest() -> URLRequest? {
        return APIRequest.asURLRequest(router: self)
    }
    
}

extension APIRouter{
    var url: URL?{
        
        let basePath = "http://gojek-contacts-app.herokuapp.com/"
        
        let relativePath: String = {
            switch self {
            case .getContacts:
                return "contacts.json"
            }
        }()
        
        return URL(string: "\(basePath)\(relativePath)")
    }
}

extension APIRouter{
    var httpMethod: HTTPMethod {
        switch self {
        case .getContacts:
            return .get
        }
    }
}

extension APIRouter{
    var httpParams: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
}
