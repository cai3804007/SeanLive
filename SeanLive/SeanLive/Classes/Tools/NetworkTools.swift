//
//  NetworkTools.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/18.
//  Copyright © 2017年 Sean. All rights reserved.
//

import Foundation
import Alamofire
enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(_ type : MethodType, URLString : String, paremeters : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any ) -> () ) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
       Alamofire.request(URLString, method: method, parameters: paremeters, encoding: URLEncoding.default, headers: nil).responseJSON { (response ) in
            guard let result = response.result.value else {
                print(response.result.error ?? "")
                return
            }
            finishedCallback(result)
        }
    }
    
    
}






