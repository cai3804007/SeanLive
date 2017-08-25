//
//  LoadFromNib.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/26.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

protocol LoadFromNib {
    
}

extension LoadFromNib where Self : UIView {
   
    static func loadFromNib(nibName : String? = nil) -> Self {
        let loadName = nibName == nil ? "\(self)" : nibName!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
    
    
}



