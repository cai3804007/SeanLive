//
//  SeanNavigationController.swift
//  SeanLive
//
//  Created by  luoht on 2017/6/21.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class SeanNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.取出系统手势事件 是一个数组
        guard let targets = interactivePopGestureRecognizer!.value(forKey: "_targets") as? [NSObject] else { return }
        
        let targetObjc = targets.first
        //取出target
        let target = targetObjc?.value(forKey: "target")
        //action不让取 创建一个action和系统的名字一样
        let action = Selector(("handleNavigationTransition:"))
        //创建手势添加
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
       
    }
    //改变导航栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
    

}
