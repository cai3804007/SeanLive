//
//  Emitterable.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/24.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

protocol Emitterable {
    
}
extension Emitterable where Self : UIViewController {
    func startEmittering(point : CGPoint) {
        // 1.创建发射器
        let emitter = CAEmitterLayer()
        
        // 2.设置发射器位置
        emitter.emitterPosition = point
        
        // 3.开启三维效果
        emitter.preservesDepth = true
        
        // 4.创建粒子
        var cells = [CAEmitterCell]()
        for i in 0..<10 {
            //4.1 创建cell
            let cell = CAEmitterCell()
            
            // 4.2设置粒子速度
            cell.velocity = 150
            // 设置波动范围
            cell.velocityRange = 100
            
            // 4.3设置粒子大小
            cell.scale = 0.7
            cell.scaleRange = 0.3
            
            // 4.4 设置粒子方向
            // 注意这里设置XY轴方向的方向   emissionLatitude是设置Z轴的方向
            cell.emissionLongitude = CGFloat(-Double.pi/2)
            cell.emissionRange = CGFloat (Double.pi/12)
            
            // 4.5 设置粒子存活时间
            cell.lifetime = 3
            cell.lifetimeRange = 1.5
            
            // 4.6 设置粒子旋转
            cell.spin = CGFloat(Double.pi/2)
            cell.spinRange = CGFloat(Double.pi/6)
            
            // 4.7 设置粒子每秒弹出的个数
            cell.birthRate = 2
            
            // 4.8 设置粒子展示图片
            cell.contents = UIImage(named: "good\(i)_30x30")?.cgImage
            
            // 4.9 添加入数组中
            cells.append(cell)
        }
        // 5. 将粒子设置到发射器中
        emitter.emitterCells = cells
        
        // 6. 将发射器的layer添加到服layer中
        view.layer.addSublayer(emitter)
 
    }
    //停止发射粒子动画
    func stopEmittering() {
        view.layer.sublayers?.filter({$0.isKind(of: CAEmitterLayer.self)}).first?.removeFromSuperlayer()
    }

}



