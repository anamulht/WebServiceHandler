//
//  Constants.swift
//  Networking
//
//  Created by Anamul Habib on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct K {
    
    enum BaseURL{
        
        case Development
        case Production
        
        var urlString: String{
            switch self {
            case .Development:
                return "https://jsonplaceholder.typicode.com/"
            case .Production:
                return "https://jsonplaceholder.typicode.com/"
            }
        }
    }
    
//    struct APIParameterKey {
//        static let password = "password"
//        static let email = "email"
//    }

}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
