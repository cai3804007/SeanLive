//
//  KingfisherExtension.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/18.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(_ URLString : String?, _ placeHoderName : String?) {
        guard let URLString = URLString else {
            return;
        }
        guard let placeHoderName = placeHoderName else {
            return
        }
        
        guard let url = URL(string: URLString) else {
            return
        }
       
        self.kf.setImage(with: url, placeholder: UIImage(named:placeHoderName) , options: nil, progressBlock: nil, completionHandler: nil)
        
    }
}
