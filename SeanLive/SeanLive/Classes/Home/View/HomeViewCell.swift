//
//  HomeViewCell.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/18.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit
import Kingfisher
class HomeViewCell: UICollectionViewCell {
    
    
    // MARK:- 控件属性
    @IBOutlet weak var liveImageView: UIImageView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var livePeopleBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK:- 定义属性
    var anchorModel : AnchorModel? {
        didSet {
            bgImageView.setImage((anchorModel?.isEvenIndex)! ? anchorModel?.pic74 : anchorModel?.pic51, "home_pic_default")
            liveImageView.isHidden = anchorModel?.live == 0
            nameLabel.text = anchorModel?.name
            livePeopleBtn.setTitle("\(anchorModel?.focus ?? 0)", for: .normal)
        }
    }
    

  
    
}
