//
//  RequestBuilder.swift
//  WebServiceHandler
//
//  Created by Salahuddin Yousuf on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Foundation
import Alamofire


public struct RequestBuilder : URLRequestConvertible {
    public let path: String
    public let method: HTTPMethod
    public let params: [String: Any?]?
    public let headers: HTTPHeaders
    
    public init (path: String, method: HTTPMethod, params: [String: Any?]?, headers: HTTPHeaders) {
        self.path = path
        self.method = method
        self.params = params
        self.headers = headers
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        //let url = try K.DevelopmentServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.httpHeaders = self.headers
        
        if let parameters = self.params {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    
    public static func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
            HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
        ]
        
        //        if let authToken = UserDefaults.standard.string(forKey: Constants.BEARER) {
        //            headers["Authorization"] = "Bearer" + " " + authToken
        //        }
        
        return headers
    }
    
}
