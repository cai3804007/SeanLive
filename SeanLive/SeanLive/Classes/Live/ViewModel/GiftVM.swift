//
//  GiftVM.swift
//  SeanLive
//
//  Created by  luoht on 2017/8/1.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class GiftVM {
    
    lazy var giftListData : [GiftPackage] = [GiftPackage]()
        
    func loadGiftData(finshCallBack: @escaping ()->()) {
        if  giftListData.count != 0{ finshCallBack()  }
        NetworkTools.requestData(.get, URLString: "http://qf.56.com/pay/v4/giftList.ios",paremeters: ["type" : 0,"page" : 1,"rows" : 150]) { (result) in
            guard let resultDic = result as? [String : Any] else { return }
            guard let dataDic = resultDic["message"] as? [String : Any] else{return}
            for i in 0..<dataDic.count {
                guard let dict = dataDic["type\(i+1)"] as? [String : Any] else { continue }
                self.giftListData.append(GiftPackage(dict: dict))
            }
            
            
            let fifle = self.giftListData.filter({return $0.t != 0 })
            
            let soter = fifle.sorted(by: { return $0.t > $1.t })
            
            self.giftListData = soter
            finshCallBack()
        }
        
    }
    
}
