//
//  MainViewController.swift
//  SeanLive
//
//  Created by  luoht on 2017/6/21.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVcFromName(stroyName: "Home")
        
    }

    func addChildVcFromName(stroyName:String) {
       let stroy = UIStoryboard.init(name: stroyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(stroy)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
