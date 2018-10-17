//
//  Utils.swift
//  SwiftCode
//
//  Created by MLeo on 2018/10/17.
//  Copyright © 2018年 swift. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static let dateFormatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateFormatter
    }()
    
    //重置图息大小
    static func imageResetSize(image:UIImage,size:CGFloat) -> UIImage{
        var scale:CGFloat
        if image.size.width > image.size.height {
            scale = image.size.width/size
        }else{
            scale = image.size.height/size
        }
        let itemSize = CGSize.init(width: image.size.width/scale, height: image.size.height/scale)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        image.draw(in: imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage!
    }
    
}
