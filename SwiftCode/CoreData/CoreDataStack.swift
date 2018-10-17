//
//  CoreDataConect.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/21.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var contextDB:NSManagedObjectContext = {

       return appDelegate.persistentContainer.viewContext
    }()
    
    
    func insert(_ entityName:String,attributeInfo:[String:String]) -> Bool{
        let insertData = NSEntityDescription.insertNewObject(forEntityName: entityName, into: contextDB)
        
        buildData(managedObject: insertData, attributeInfo: attributeInfo)

        do {
            try contextDB.save()
            return true
        }catch {
            fatalError(error as! String)
        }
        return false
    }
    
    
    func fetch(_ entityName:String,predicate:String?,sort:[[String:Bool]]?,limit:Int?) -> [NSManagedObject]?{
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        if let myPredicate = predicate {
            request.predicate = NSPredicate(format:myPredicate)
        }
        if let mySort = sort {
            var sortDescriptors:[NSSortDescriptor] = []
            for sortDescriptor in mySort{
                for(k,v) in sortDescriptor{
                    sortDescriptors.append(NSSortDescriptor(key: k, ascending: v))
                }
            }
            request.sortDescriptors = sortDescriptors
        }
        
        if let limitNumber = limit {
            request.fetchLimit = limitNumber
        }
        do {
            return  try contextDB.fetch(request) as? [NSManagedObject]
        } catch {
            fatalError(error as! String)
        }
        
        return nil
    }
    
    
    func update(_ entityName:String,predicate:String?,attributeInfo:[String:String]) -> Bool{
        if let results = self.fetch(entityName, predicate: predicate, sort: nil, limit: nil){
            for result in results{
                buildData(managedObject: result, attributeInfo: attributeInfo)
            }
            do {
                try contextDB.save()
                return true
            }catch {
                fatalError(error as! String)
            }
        }
        return false
    }
    
    
    func delete(_ entityName:String,predicate:String?) -> Bool{
        if let results = self.fetch(entityName, predicate: predicate, sort: nil, limit: nil){
            for result in results{
                contextDB.delete(result)
            }
            do{
                try contextDB.save()
                return true
            }catch {
                fatalError(error as! String)
            }
        }
        return false
        
        
    }
    
    func buildData(managedObject:NSManagedObject,attributeInfo:[String:String]){
        for (key,value) in attributeInfo {
            let attributeType =  managedObject.entity.attributesByName[key]?.attributeType
            if attributeType == NSAttributeType.integer64AttributeType || attributeType == NSAttributeType.integer32AttributeType || attributeType == NSAttributeType.integer16AttributeType {
                managedObject.setValue(Int(value), forKey: key)
            }else if attributeType == NSAttributeType.stringAttributeType  {
                managedObject.setValue(value, forKey: key)
            }else if attributeType == NSAttributeType.doubleAttributeType || attributeType == NSAttributeType.floatAttributeType {
                managedObject.setValue(Double(value), forKey: key)
            }else if attributeType == NSAttributeType.booleanAttributeType {
                managedObject.setValue(value == "true" ? true : false, forKey: key)
            }else{
                managedObject.setValue(value,forKey: key)
            }
        }
    }
    

}
