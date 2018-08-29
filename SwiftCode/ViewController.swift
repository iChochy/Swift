//
//  ViewController.swift
//  swift-11
//
//  Created by MLeo on 2018/8/27.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    let dictionary:[String:Any] = [
        "firstName":"M",
        "lastName":"Leo",
        "agt":32,
        "children":[
            "hanhan"
        ]
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dictionary)
        let jsonString = dataToJson(dictionary: dictionary)
        print(jsonString as Any)
        let newDictionary =  jsonToData(jsonString: jsonString!)
        print(newDictionary as Any)
    }
    
    
    func dataToJson(dictionary:Dictionary<String,Any>) -> String?{
        do {
            let json = try JSONSerialization.data(withJSONObject: dictionary, options:.prettyPrinted)
            let jsonString = String(bytes: json, encoding: .utf8)
            return jsonString
        } catch let error {
            print(error)
        }
        return nil
    }
    
    
    func jsonToData(jsonString:String) -> Dictionary<String,Any>?{
        do {
            let data = jsonString.data(using: .utf8, allowLossyConversion: false)
            let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            if jsonObject is Dictionary<String, Any> {
                let dictionary = jsonObject as! Dictionary<String, Any>
                return dictionary
            }
        } catch let error {
            print(error)
        }
        return nil
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}


