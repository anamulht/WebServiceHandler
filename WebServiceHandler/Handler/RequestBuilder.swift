//
//  RequestBuilder.swift
//  WebServiceHandler
//
//  Created by Anamul Habib on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Foundation
import Alamofire


struct RequestBuilder : URLRequestConvertible {
    
    let path: String
    let method: HTTPMethod
    let params: [String: Any?]?
    let additionalHeaders: HTTPHeaders?
    
    init (path: String, method: HTTPMethod, params: [String: Any?]?, additionalHeaders: HTTPHeaders?) {
        self.path = path
        self.method = method
        self.params = params
        self.additionalHeaders = additionalHeaders
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try K.BaseURL.Production.urlString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.httpHeaders = getHeaders()
        
        if let parameters = self.params {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    
    private func getHeaders() -> HTTPHeaders {
        
        var headers: HTTPHeaders = [
            HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue,
            HTTPHeaderField.contentType.rawValue : ContentType.json.rawValue
        ]
        
        if let additionalHeaders = additionalHeaders{
            for header in additionalHeaders{
                headers.add(header)
            }
        }
        
        return headers
    }
    
}
