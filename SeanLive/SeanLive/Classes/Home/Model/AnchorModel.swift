//
//  AnchorModel.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/18.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class AnchorModel: BaseModel {

    var roomid : Int = 0
    var name : String = ""
    var pic51 : String = ""
    var pic74 : String = ""
    var live : Int = 0 // 是否在直播
    var push : Int = 0 // 直播显示方式
    var focus : Int = 0 // 关注数
    
    var uid : String = ""
    
    var isEvenIndex : Bool = false
    
}
