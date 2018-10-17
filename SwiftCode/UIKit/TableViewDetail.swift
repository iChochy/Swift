//
//  TableViewModel.swift
//  SwiftCode
//
//  Created by MLeo on 2018/10/12.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class TableViewDetail: Codable {
    
    let title:String
    let detail:String
    let imageName:String
    let createDate:Date
    
    init(title:String,detail:String,imageName:String,createDate:Date) {
        self.title = title
        self.detail = detail
        self.imageName = imageName
        self.createDate = createDate
    }

}
