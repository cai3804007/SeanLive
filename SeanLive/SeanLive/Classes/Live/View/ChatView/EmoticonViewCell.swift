//
//  EmoticonViewCell.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/26.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class EmoticonViewCell: UICollectionViewCell {

    
    @IBOutlet weak var iconImage: UIImageView!
 
    var  model : EmoticonModel? {
        didSet {
            iconImage.image = UIImage(named: (model?.emoticonName)!)
            iconImage.contentMode = .center
        }
    }
    
}
