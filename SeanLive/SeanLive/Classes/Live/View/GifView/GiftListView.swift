//
//  GiftListView.swift
//  SeanLive
//
//  Created by  luoht on 2017/8/1.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

private let kgiftViewCell = "kgiftViewCell"

class GiftListView: UIView,LoadFromNib {

    @IBOutlet weak var giftView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var giveBtn: UIButton!
    
    @IBOutlet weak var giftContenView: UIView!
    
    fileprivate var pageCollectionView : SeanGiftView!
    
    fileprivate var giftVM : GiftVM = GiftVM()
    
    fileprivate var currentIndex : IndexPath?
    
    var sendGifBlock : (( _ model : GiftModel)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
        
    }
    
    
    // MARK:- 点击充值
    @IBAction func topUpBtnClick(_ sender: Any) {
        
    }
    // MARK:- 点击赠送
    @IBAction func giveBtnClick(_ sender: Any) {
        guard (currentIndex != nil) else {
            return
        }
          let model = giftVM.giftListData[(currentIndex?.section)!].list[(currentIndex?.item)!]
        self.sendGifBlock?(model)

    }
    
    
 
}


extension GiftListView {
    func configUI() {
        configContentView()
        loadData()
    }
    
    func configContentView() {
        let style = SeanPageViewStyle()
        style.isScrollEnable = false
        style.isShowBottomLine = true
        style.normalColor = UIColor(r: 255, g: 255, b: 255)
        
        let layout = SeanGiftLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.clos = 4
        layout.rows = 2
        
        var pageViewFrame = giftContenView.bounds
        pageViewFrame.size.width = kScreenW
        pageCollectionView = SeanGiftView(frame: pageViewFrame, titles: ["热门","高级","豪华","专属"], style: style, isTitleTop: true, layout: layout)
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        
        pageCollectionView.registerNib(nib: UINib(nibName: "GiftViewCell", bundle: nil), idenfier: kgiftViewCell)
        giftContenView.addSubview(pageCollectionView)
        
        
    }
    
    func loadData() {
        self.giftVM.loadGiftData {
            self.pageCollectionView.reloadData()
        }
    }
    
}

extension GiftListView : SeanGiftViewDelegate,SeanGiftViewDataSource {
    func collectionView(_ giftView: SeanGiftView, didSelectItemAt indexPath: IndexPath) {
        currentIndex = indexPath
    }

    func collectionView(_ giftView: SeanGiftView, numberOfItemsInSection section: Int) -> Int {
        let package = giftVM.giftListData[section]
         return package.list.count
    }

    func numberOfSections(_ giftView: SeanGiftView) -> Int {
        return giftVM.giftListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, giftView: SeanGiftView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kgiftViewCell, for: indexPath) as! GiftViewCell
        let model = giftVM.giftListData[indexPath.section]
        cell.model = model.list[indexPath.item]
        
        return cell
    }
    
}















