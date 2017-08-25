//
//  GiftPackage.swift
//  SeanLive
//
//  Created by  luoht on 2017/8/1.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class GiftPackage: BaseModel {
     var t : Int = 0
    var title : String = ""
    var list : [GiftModel] = [GiftModel]()
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "list" {
            if let listArray = value as? [[String : Any]] {
                for dic in listArray {
                    list.append(GiftModel(dict: dic))
                }
            }
        }else{
                super.setValue(value, forKey: key)
        }
    }
}
