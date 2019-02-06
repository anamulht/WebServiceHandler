//
//  APIRouter2.swift
//  WebServiceHandler
//
//  Created by Salahuddin Yousuf on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Alamofire

enum APIRouter2{
    
    case api1
    case api2(param1: String, param2: Int)
    
    var requestBuilder: RequestBuilder{
        switch self {
        case .api1:
            return RequestBuilder.init(path: "posts", method: .get, params: nil, headers: RequestBuilder.getHeaders())
        case .api2(let param1, let param2):
            return RequestBuilder.init(path: "api2", method: .post, params: ["key1" : param1, "key" : param2], headers: RequestBuilder.getHeaders())
        }
    }
    
}
