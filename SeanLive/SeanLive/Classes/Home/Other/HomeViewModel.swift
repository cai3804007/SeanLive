//
//  HomeViewModel.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/18.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class HomeViewModel {
    lazy var anchorModels = [AnchorModel]()
}

extension HomeViewModel {
    func loadHomeData(type : HomeModel, index: Int,finisheCallback : @escaping () ->()) {
        NetworkTools.requestData(.get, URLString: "http://qf.56.com/home/v4/moreAnchor.ios", paremeters: ["type" : type.type, "index" : index, "size" : 48]) { (result) -> Void in
            guard let resultDic = result as? [String : Any] else { return }
            guard let messageDict = resultDic["message"] as? [String : Any] else { return }
            guard let dataArray = messageDict["anchors"] as? [[String : Any]] else { return }
            
            for (index, dic) in dataArray.enumerated() {
                
                let model = AnchorModel(dict: dic)
                model.isEvenIndex = index % 2 == 0
                self.anchorModels.append(model)
            }
            finisheCallback()
        }
        
    }
    
    
    
}




