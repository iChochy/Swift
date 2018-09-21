//
//  SQLiteViewController.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/19.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class SQLiteViewController: UIViewController {

    var db:SQLiteConnect?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let sqlitePath = urls.first!.appendingPathComponent("sqlite.db").absoluteString
        print("db path: \(sqlitePath)")
        db = SQLiteConnect(path: sqlitePath)!
        dbOperation()
        
        // Do any additional setup after loading the view.
    }

    func dbOperation(){
        let tableName = "user"
        if let dbConnect = db {
        
        let _ = dbConnect.createTable(tableName: tableName, columns: ["id integer primary key autoincrement","name text","height real"])
        let _ = dbConnect.insert(tableName: tableName, row: ["name":"'MLeo'","height":"16.5"])
        let _ = dbConnect.insert(tableName: tableName, row: ["name":"'Chochy'","height":"17.8"])
        let _ = dbConnect.insert(tableName: tableName, row: ["name":"'MM'","height":"15.5"])
            
            var statement = dbConnect.fetch(tableName: tableName, param: "id like '%2'", order: "id desc")
        
            while sqlite3_step(statement) == SQLITE_ROW  {
                let id = sqlite3_column_int(statement, 0)
                let name = sqlite3_column_text(statement, 1)
                let height = sqlite3_column_double(statement, 2)
                print("id:\(id)\t|name:\(String(cString: name!))\t|height:\(height)")
            }
            
        sqlite3_finalize(statement)
            
        let _ = dbConnect.update(tableName: tableName, row: ["name" : "'iChochy'"], param: "id = 2")
            
            statement = dbConnect.fetch(tableName: tableName,param: nil, order: "id desc")
        
        while sqlite3_step(statement) == SQLITE_ROW  {
            let id = sqlite3_column_int(statement, 0)
            let name = sqlite3_column_text(statement, 1)
            let height = sqlite3_column_double(statement, 2)
            print("id:\(id)\t|name:\(String(cString: name!))\t|height:\(height)")
        }
        
        sqlite3_finalize(statement)
            
    }
        
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
