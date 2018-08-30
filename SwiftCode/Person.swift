//
//  Person.swift
//  SwiftCode
//
//  Created by MLeo on 2018/8/29.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var firstName:String?
    var lastName:String?
    
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(handleSetPersonInfoNotification), name:Notification.Name(rawValue: AppDelegate.notificationName()), object: UIApplication.shared.delegate)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    @objc func handleSetPersonInfoNotification(notification:Notification){
        firstName = notification.userInfo?[AppDelegate.personInfoKeyFirstName()] as? String
        lastName = notification.userInfo?[AppDelegate.personInfoKeyLastName()] as? String
    }
    
    
    

}
