//
//  APIClient.swift
//  WebServiceHandler
//
//  Created by Anamul Habib on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(requestBuilder:RequestBuilder, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void) -> DataRequest {
        return AF.request(requestBuilder)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                completion(response.result)
        }
    }
    
    
    static func getPosts(completion:@escaping (Result<[PostList]>)->Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(requestBuilder: APIRouter1.api1.requestBuilder, decoder: jsonDecoder, completion: completion)
    }
    
    
    //    static func login(email: String, password: String, completion:@escaping (Result<User>)->Void) {
    //        performRequest(requestBuilder: APIRouter.login(email: email, password: password), completion: completion)
    //    }
}
