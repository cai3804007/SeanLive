//
//  GiftViewCell.swift
//  SeanLive
//
//  Created by  luoht on 2017/8/1.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class GiftViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    var model : GiftModel? {
        didSet {
           iconImage.setImage(model?.img2, "room_btn_gift")
            title.text = model?.subject
            price.text = "\(model?.coin ?? 0)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let selectedView = UIView()
        selectedView.layer.cornerRadius = 5
        selectedView.clipsToBounds = true
        selectedView.layer.borderWidth = 1
        selectedView.layer.borderColor = UIColor.orange.cgColor
        selectedView.backgroundColor = UIColor.blue
        selectedBackgroundView = selectedView
        
        
    }

}
