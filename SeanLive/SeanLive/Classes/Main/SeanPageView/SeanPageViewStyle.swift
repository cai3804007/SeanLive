//
//  SeanPageViewStyle.swift
//  SeanPageView
//
//  Created by  luoht on 2017/6/15.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

class SeanPageViewStyle {
    /// 是否是滚动的Title
    var isScrollEnable : Bool = false
    /// 普通Title颜色
    var normalColor : UIColor = UIColor(r: 0, g: 0, b: 0)
    /// 选中Title颜色
    var selectedColor : UIColor = UIColor(r: 255, g: 127, b: 0)
    /// Title字体大小
    var font : UIFont = UIFont.systemFont(ofSize: 15.0)
    /// 滚动Title的字体间距
    var titleMargin : CGFloat = 20
    /// title的高度
    var titleHeight : CGFloat = 44
    
    /// 是否显示底部滚动条
    var isShowBottomLine : Bool = false
    /// 底部滚动条的颜色
    var bottomLineColor : UIColor = UIColor.orange
    /// 底部滚动条的高度
    var bottomLineH : CGFloat = 2
    
    
    /// 是否进行缩放
    var isNeedScale : Bool = false
    var scaleRange : CGFloat = 1.2
    
    
    /// 是否显示遮盖
    var isShowCover : Bool = false
    /// 遮盖背景颜色
    var coverBgColor : UIColor = UIColor.lightGray
    /// 文字&遮盖间隙
    var coverMargin : CGFloat = 5
    /// 遮盖的高度
    var coverH : CGFloat = 25
    /// 设置圆角大小
    var coverRadius : CGFloat = 12
    //titleView背景色
    var titleBgColor : UIColor = UIColor.gray
    //pageControl选中色
    var pageCurrtenColor : UIColor = UIColor.white
    //pageControl未选中颜色
    var pageTintColor : UIColor = UIColor.darkGray
    
    var pageBgColor : UIColor = UIColor.init(r: 0, g: 0, b: 0)
    
    //contentView背景色
    var contenViewBgColor : UIColor = UIColor.init(r: 0, g: 0, b: 0, alpha: 1)
    
}




