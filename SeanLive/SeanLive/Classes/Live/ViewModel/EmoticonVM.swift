//
//  EmoticonVM.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class EmoticonVM{
    
    static let shareInstance : EmoticonVM = EmoticonVM()
    lazy var packages : [EmoticonPackage] = [EmoticonPackage]()
    init() {
        packages.append(EmoticonPackage(plistName: "QHNormalEmotionSort.plist"))
        packages.append(EmoticonPackage(plistName: "QHSohuGifSort.plist"))
    }
    

}
