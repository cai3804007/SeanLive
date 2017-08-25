//
//  EmoticonView.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/26.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

private let kGiftCellIdent = "kGiftCellIdent"

class EmoticonView: UIView {
    
    var emoticonClickCallBlack : ((EmoticonModel)-> Void)?
    
    fileprivate lazy var collectionView : SeanGiftView = {
        
        let layout = SeanGiftLayout()
        layout.rows = 3
        layout.clos = 7
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        let titleStyle = SeanPageViewStyle()
        titleStyle.isShowBottomLine = true
        
       let collection = SeanGiftView(frame: self.bounds, titles: ["普通","粉丝专属"], style: titleStyle, isTitleTop: false, layout: layout)
        
        return collection
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        configUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmoticonView {
    func configUI() {
        configContentView()
        
    }
    func configContentView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerNib(nib: UINib.init(nibName: "EmoticonViewCell", bundle: nil), idenfier: kGiftCellIdent)
        addSubview(collectionView)
        
    }
    
    
}

extension EmoticonView : SeanGiftViewDelegate,SeanGiftViewDataSource {
    func collectionView(_ collectionView: UICollectionView, giftView: SeanGiftView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : EmoticonViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kGiftCellIdent, for: indexPath) as! EmoticonViewCell
        cell.model = EmoticonVM.shareInstance.packages[indexPath.section].emoticons[indexPath.item]
        return cell
    }
    func numberOfSections(_ giftView: SeanGiftView) -> Int {
        return EmoticonVM.shareInstance.packages.count
    }
    
    func collectionView(_ giftView: SeanGiftView, numberOfItemsInSection section: Int) -> Int {
        return EmoticonVM.shareInstance.packages[section].emoticons.count
    }
    
    func collectionView(_ giftView: SeanGiftView, didSelectItemAt indexPath: IndexPath) {
        let model = EmoticonVM.shareInstance.packages[indexPath.section].emoticons[indexPath.item]
        guard emoticonClickCallBlack != nil else {
            return
        }
        
        emoticonClickCallBlack!(model)
    }
    
}










