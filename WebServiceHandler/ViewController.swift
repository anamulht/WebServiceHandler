//
//  ViewController.swift
//  WebServiceHandler
//
//  Created by Salahuddin Yousuf on 2/5/19.
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
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }


}

