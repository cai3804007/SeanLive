//
//  EmoticonPackage.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/28.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class EmoticonPackage {
    lazy var emoticons : [EmoticonModel] = [EmoticonModel]()
    init(plistName : String){
        guard let path = Bundle.main.path(forResource: plistName, ofType: nil) else {
            return
        }
        
        guard let emoticonArray = NSArray(contentsOfFile: path) as? [String] else{ return }
        for string in emoticonArray {
            let emoticonModel = EmoticonModel(emoticonName: string)
            emoticons.append(emoticonModel)
        }
    }    
    
}
