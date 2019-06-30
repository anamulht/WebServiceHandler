//
//  APIRouter.swift
//  WebServiceHandler
//
//  Created by Anamul Habib on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Alamofire

enum APIRouter1{
    
    case api1
    case api2(param1: String, param2: Int)
    
    var requestBuilder: RequestBuilder{
        switch self {
        case .api1:
            return RequestBuilder.init(path: "posts", method: .get, params: nil, additionalHeaders: nil)
        case .api2(let param1, let param2):
            return RequestBuilder.init(path: "api2", method: .post, params: ["key1" : param1, "key" : param2], additionalHeaders: nil)
        }
    }
    
}
