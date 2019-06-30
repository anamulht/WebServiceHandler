//
//  ViewController.swift
//  WebServiceHandler
//
//  Created by Anamul Habib on 2/5/19.
//  Copyright © 2019 SSL Wireless. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIClient.getPosts { result in
            switch result{
            case .success(let posts):
                print(posts)
//                let jsonEncoder = JSONEncoder()
//                do {
//                    let jsonData = try jsonEncoder.encode(posts)
//                    let jsonString = String(data: jsonData, encoding: .utf8)
//                    print("JSON String : " + jsonString!)
//                }
//                catch {
//                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

