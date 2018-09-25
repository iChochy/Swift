//
//  SQLiteConnect.swift
//  SwiftCode
//
//  Created by MLeo on 2018/9/19.
//  Copyright © 2018年 swift. All rights reserved.
//

import Foundation

class SQLiteConnect {
    var db:OpaquePointer?
    
    init?(path : String) {
        db = openDB(path: path)
        if db == nil{
            return nil
        }
    }
    
    func openDB(path:String) -> OpaquePointer? {
        var DBConnect:OpaquePointer?
        if sqlite3_open(path, &DBConnect) == SQLITE_OK{
            return DBConnect
        }else{
            return nil
        }
    }
    
    func createTable(tableName:String,columns:[String]) -> Bool{
        
        let sql = "create table if not exists \(tableName) (\(columns.joined(separator: ",")))"
        
        print("Create table sql:\(sql)")
        if sqlite3_exec(db, sql.cString(using: .utf8), nil, nil, nil) == SQLITE_OK{
            return true
        }
        return false
    }
    
    
    func insert(tableName:String,row:[String:String]) -> Bool{
        var statement:OpaquePointer?
        let sql = "insert into \(tableName) (\(row.keys.joined(separator: ","))) values (\(row.values.joined(separator: ",")))"
        
        print("insert sql: \(sql)")
        
        if sqlite3_prepare_v2(db, sql.cString(using: .utf8), -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE{
                return true
            }
            sqlite3_finalize(statement)
        }
        
        return false;
    }
    
    func fetch(tableName:String,param:String?,order:String?) ->OpaquePointer{
        var statement:OpaquePointer?
        var sql = "select * from \(tableName) "
        if let paramSQL = param {
            sql+="where \(paramSQL) "
        }
        if let orderSQL = order{
            sql+="order by \(orderSQL)"
        }
        
        print("fetch sql: \(sql)")
        
        sqlite3_prepare_v2(db, sql.cString(using: .utf8), -1, &statement, nil)
        return statement!
    }
    
    func update(tableName:String,row:[String:String],param:String?) -> Bool{
        var statement:OpaquePointer?
        var sql = "update \(tableName) set "
        var info:[String] = []
        for (k,v) in row {
            info.append("\(k) = \(v)")
        }
        sql += info.joined(separator: ",")
        
        if let paramSQL = param {
            sql += "where \(paramSQL)"
        }
        
        print("update sql: \(sql)")
        
        if sqlite3_prepare_v2(db, sql.cString(using: .utf8), -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                return true
            }
            sqlite3_finalize(statement)
        }
        return false
    }
    
    func delete(tableName:String,param:String?) -> Bool{
        var statement:OpaquePointer?
        var sql = "delete from \(tableName) "
        if let paramSQL = param {
            sql += "where \(paramSQL)"
        }
        
        print("delete sql:\(sql)")
        
        if sqlite3_prepare_v2(db, sql.cString(using: .utf8), -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                return true
            }
            sqlite3_finalize(statement)
        }
        return false
    }

}
