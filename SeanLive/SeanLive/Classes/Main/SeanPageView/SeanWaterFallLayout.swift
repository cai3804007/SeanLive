//
//  SeanWaterFallLayout.swift
//  SeanWaterLayoutTest
//
//  Created by  luoht on 2017/6/22.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

protocol SeanWaterFallLayoutDataSoure : class {
    func waterFallLayoutHeight(_ waterLayout : SeanWaterFallLayout, item :Int) ->CGFloat
    
}

class SeanWaterFallLayout: UICollectionViewFlowLayout {
    
    weak var dataSoure : SeanWaterFallLayoutDataSoure?
    
    var cols : Int = 4
    var rows : Int = 2
    fileprivate lazy var cellAttrs : [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    fileprivate var maxH : CGFloat = 0
    fileprivate var startIndex = 0
    fileprivate lazy var totalHeight : [CGFloat] = Array(repeating: self.sectionInset.top , count: self.cols)
}


extension SeanWaterFallLayout {
    
    override func prepare() {
        super.prepare()
        // 0.获取cell的个数
        let itemCount = collectionView!.numberOfItems(inSection: 0)
        
 
        // 1.计算item的高度
        let itemW = (collectionView!.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing * CGFloat(cols - 1))/(CGFloat)(cols)
        
        for i in startIndex..<itemCount {
            let  indexPath = IndexPath(item: i, section: 0);
            let cellArrt = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            guard let itemH = dataSoure?.waterFallLayoutHeight(self, item: i)  else { fatalError("请实现对应的数据源方法,并且返回cell的高度") }
            //2.取出最小值
            let minH = totalHeight.min()!
            //3.取出最小值的index
            let minIndex = totalHeight.index(of: minH)!
            //4.计算item X Y
            let itemX = sectionInset.left + (minimumInteritemSpacing + itemW ) * CGFloat(minIndex)
            let itemY = minH
            
            cellArrt.frame = CGRect(x: itemX, y: itemY, width: itemW, height: itemH)
            
            cellAttrs.append(cellArrt)
            //5.改变最小值
            totalHeight[minIndex] = minH + minimumInteritemSpacing + itemH
        }
        //6.记录最大值以便给偏移量赋值
       maxH = totalHeight.max()!
        //7.记录未计算Attrs个数
       startIndex = itemCount
        
    }
}

extension SeanWaterFallLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //返回所有Attributes元素
        return cellAttrs
    }
}

extension SeanWaterFallLayout {
    override var collectionViewContentSize: CGSize {
        //返回偏移量距离
        return CGSize(width: 0, height: totalHeight.max()! + sectionInset.bottom - minimumLineSpacing)
        
    }
    
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
    
   
}






















