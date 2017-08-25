//
//  HomeViewController.swift
//  SeanLive
//
//  Created by  luoht on 2017/6/21.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        configNav()
        configUI()
    }
    
    func configNav() {
        let leftImage = UIImage(named: "home-logo")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .plain, target: nil, action: nil)
        
        let collecImage = UIImage(named: "search_btn_follow")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: collecImage, style: .plain, target: self, action: #selector(collecClick))
 
        let searchFrame = CGRect(x: 0, y: 0, width: 200, height: 32)
        
        let searchBar = UISearchBar(frame: searchFrame)
        searchBar.placeholder = "主播昵称/房间号/链接"
        let searchFile = searchBar.value(forKey: "_searchField") as? UITextField
        searchBar.searchBarStyle = .minimal
        searchFile?.textColor = UIColor.white
        
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK:- 点击事件
extension HomeViewController {
    func collecClick() {
        
        
        
    }
}

// MARK:- 布局界面
extension HomeViewController {
    func configUI() {
        // 1.获取plist文档数据
       let models = loadPlist()
       
      let style = SeanPageViewStyle()
        style.isScrollEnable = true
        style.isShowCover = true
    let pageFrame = CGRect(x: 0, y: kNavHeight + kStatusBarH, width: kScreenW, height: kScreenH - kNavHeight - kStatusBarH - 44)
        //取出model的第0个的title属性
        let titles = models.map({ $0.title})
        
        var childVcs = [AnchorViewController]()
        for model in models {
            let childVc = AnchorViewController()
            childVc.homeType = model
            childVcs.append(childVc)
        }
        
     let pageView = SeanPageView(frame: pageFrame, style: style, childVcs: childVcs, titles: titles, parentVc: self)
        
        view.addSubview(pageView)
    }
    
    func loadPlist() -> [HomeModel] {
        
        let path = Bundle.main.path(forResource: "types", ofType: "plist")!
    
        let dics = NSArray(contentsOfFile: path) as! [[String : Any]]
        
        var models = [HomeModel]()
        
        for dic in dics {
            let model = HomeModel(dict: dic)
            models.append(model)
        }
        return models
    }
 
}























