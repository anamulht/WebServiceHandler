//
//  PostList.swift
//  WebServiceHandler
//
//  Created by Salahuddin Yousuf on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import Foundation

class PostList: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String?
}

//extension PostList {
//    enum CodingKeys: String, CodingKey {
//        case userId
//        case id
//        case title
//        case body
//    }
//}
