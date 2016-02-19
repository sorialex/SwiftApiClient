//
//  ViewController.swift
//  SwiftAPIClient
//
//  Created by Alex Sori on 18/2/16.
//  Copyright © 2016 Swift Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let configuration = APIConfiguration();
        
        let postsConnection = FetchPostsConnection.ReadPost("1", configuration);
        
        if let request = postsConnection.request() {
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                if let data = data {
                    do {
                        let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
                        print(JSON);
                    } catch {
                        
                    }
                }
                print("DONE");
            }
            task.resume();
        }
    }
}