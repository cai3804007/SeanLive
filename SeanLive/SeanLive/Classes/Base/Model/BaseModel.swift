//
//  BaseModel.swift
//  SeanLive
//
//  Created by  luoht on 2017/6/21.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class BaseModel: NSObject {

    init(dict :[String : Any] ) {
         super.init()
         setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
