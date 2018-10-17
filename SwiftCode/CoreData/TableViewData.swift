//
//  TableVIewData.swift
//  SwiftCode
//
//  Created by MLeo on 2018/10/12.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit
import CoreData

class TableViewData: NSObject {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let tableViewCellTable = "TableViewCell"
    
    let datas = "{}"
    
    
    func initData() -> [TableViewCell]{
        let details:[TableViewCell] = []
        let detail = TableViewCell()
        detail.id = UUID()
        detail.title = ""
        
        
        return details
    }
    
    
    func insertTableViewDetail(tableViewDetail:TableViewCell){
        let context = appDelegate.persistentContainer.viewContext;
        context.insert(tableViewDetail)
        appDelegate.saveContext()
    }
    
    func fetchTableViewDetails() -> [TableViewCell]?{
        let context = appDelegate.persistentContainer.viewContext;
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: tableViewCellTable)
        do {
             return try context.fetch(request) as? [TableViewCell]
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return nil
    }
    

}
