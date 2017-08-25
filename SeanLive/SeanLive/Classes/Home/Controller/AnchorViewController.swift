//
//  AnchorViewController.swift
//  SeanLive
//
//  Created by  luoht on 2017/6/22.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

private let kEdgeMargin :CGFloat = 10
private let kCellIdentifi = "AnchorCell"

class AnchorViewController: UIViewController {
    var homeType : HomeModel!
    fileprivate var homeVM : HomeViewModel = HomeViewModel()
    fileprivate lazy var collection : UICollectionView = {
        let layout = SeanWaterFallLayout()
        layout.sectionInset = UIEdgeInsetsMake(kEdgeMargin, kEdgeMargin, kEdgeMargin, kEdgeMargin)
        layout.minimumLineSpacing = kEdgeMargin
        layout.minimumInteritemSpacing = kEdgeMargin
        layout.dataSoure = self
        layout.cols = 2
        let collrction = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collrction.register(UINib(nibName: "HomeViewCell", bundle: nil), forCellWithReuseIdentifier: kCellIdentifi)
//        collrction.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellIdentifi)
        collrction.autoresizingMask = [.flexibleHeight,.flexibleWidth];
        collrction.backgroundColor = UIColor.white
        collrction.delegate = self
        collrction.dataSource = self
       return collrction
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor()
        configUI()
        loadData(index: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

extension AnchorViewController {
    func loadData(index : Int) {
        self.homeVM.loadHomeData(type: homeType, index: index, finisheCallback: {
            self.collection.reloadData()
        })
    }
}


extension AnchorViewController {
    func configUI() {
        
        view.addSubview(collection)
        
        
    }
    
    
}

extension AnchorViewController : SeanWaterFallLayoutDataSoure,UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeVM.anchorModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifi, for: indexPath) as! HomeViewCell
        cell.anchorModel = homeVM.anchorModels[indexPath.item]
        if indexPath.item == homeVM.anchorModels.count - 1 {
             loadData(index: homeVM.anchorModels.count)
        }
//          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifi, for: indexPath)
//        cell.contentView.backgroundColor = UIColor.randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.homeVM.anchorModels[indexPath.item]
       let room = RommController()
        room.anchorModel = model
       self.navigationController?.pushViewController(room, animated: true)
    }
    
    func waterFallLayoutHeight(_ waterLayout: SeanWaterFallLayout, item: Int) -> CGFloat {
        return item % 2 == 0 ? kScreenW * 2/3 : kScreenW * 0.5
    }
    
}

 



























