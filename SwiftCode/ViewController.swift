//
//  ViewController.swift
//  swift-11
//
//  Created by MLeo on 2018/8/27.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit



class ViewController: UIViewController {


    let notificationName = "NotificationNameGoesHere"
    
    
    override func loadView() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notification = Notification(name: Notification.Name(rawValue: notificationName), object: self, userInfo:[
            "key":"value"
            ]
        )
        
        NotificationCenter.default.post(notification)
        
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

