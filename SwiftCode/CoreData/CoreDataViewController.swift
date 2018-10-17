//
//  CoreDataViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/21.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    
    let entityName:String = "User"
    var stack:CoreDataStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        stack = CoreDataStack()
        self.insert()
        self.update()
        self.fetch()
        self.delete()
    }
    
    
    func delete(){
        let result = stack.delete(entityName, predicate: "id = 'FBF70582-9E3D-45AD-8C21-488B0C16A404'")
         print("delete result:\(result)")
    }
    
    func update(){
        let result = stack.update(entityName, predicate: "name = 'Chochy'", attributeInfo: ["name":"iChochy"])
        print("update result:\(result)")
    }
    
    func fetch(){
       let results = stack.fetch(entityName, predicate: nil, sort: [["name":true]], limit: nil)
        for result in results! {
            print("id:\(result.value(forKey: "id")!) \t|name:\(result.value(forKey: "name")!) \t|height:\(result.value(forKey: "height")!)")
        }
    }
    
    func insert(){
        let attributeInfo = ["id":UUID().uuidString,"name":"Chochy","height":"16.5"]
       let result = stack.insert(entityName, attributeInfo:  attributeInfo)
        
        print("insert result:\(result)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
