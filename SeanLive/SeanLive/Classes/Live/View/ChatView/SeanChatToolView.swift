//
//  SeanChatToolView.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/26.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

protocol SeanChatToolViewDelegate : class {
    func seanChatToolViewSendMessage(toolView : SeanChatToolView, message : String)
}

class SeanChatToolView: UIView,LoadFromNib {

    @IBOutlet weak var inpuTextFile: UITextField!
    
    @IBOutlet weak var senderBtn: UIButton!
 
    weak var delegate : SeanChatToolViewDelegate?
    
     lazy var emoticonBtn : UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
    fileprivate lazy var emoticonView : EmoticonView = EmoticonView(frame : CGRect(x: 0, y: 0, width: kScreenW, height: 250))
    
    override func awakeFromNib() {
         super.awakeFromNib()
         configUI()
    }
    @IBAction func changeEditing(_ sender: UITextField) {
        senderBtn.isEnabled = sender.text?.characters.count != 0
    }
    
    
    
    @IBAction func senderClick(_ sender: UIButton) {
        let text = self.inpuTextFile.text
        self.inpuTextFile.text = ""
        sender.isEnabled = false
        self.delegate?.seanChatToolViewSendMessage(toolView: self, message: text!)
        
    }
}

extension SeanChatToolView {
    func configUI() {
        emoticonBtn.setImage(UIImage(named:"chat_btn_emoji"), for: .normal)
        emoticonBtn.setImage(UIImage(named : "chat_btn_keyboard"), for: .selected)
        emoticonBtn.addTarget(self, action: #selector(emoticonBtnCilck(sender:)), for: .touchUpInside)
        
        inpuTextFile.rightView = emoticonBtn
        inpuTextFile.rightViewMode = .always
        inpuTextFile.allowsEditingTextAttributes = true
        
        emoticonView.emoticonClickCallBlack = {[weak self] emotcion in
            // 1.判断是否是删除按钮
            if emotcion.emoticonName == "delete-n" {
                self?.inpuTextFile.deleteBackward()
                return
            }
            // 2获取光标位置
            guard let range = self?.inpuTextFile.selectedTextRange else {
                return
            }
            // 3.给TextFile赋值
            self?.inpuTextFile.replace(range, withText: emotcion.emoticonName)
            
        }
        
    }
    
}








// MARK:- 点击事件
extension SeanChatToolView {

    
    func emoticonBtnCilck(sender : UIButton){
        sender.isSelected = !sender.isSelected
        let range = inpuTextFile.selectedTextRange
        //切换键盘
        inpuTextFile.inputView = inpuTextFile.inputView == nil ? emoticonView : nil
//        if sender.isSelected {
//            inpuTextFile.inputView = emoticonView
//        }else{
//            inpuTextFile.inputView = nil
//        }
        inpuTextFile.resignFirstResponder()
        inpuTextFile.becomeFirstResponder()
        inpuTextFile.selectedTextRange = range
        
    }
    
    func inputFileBecomeFirstResponder() {
        inpuTextFile.inputView = nil
        self.emoticonBtn.isSelected = false
        inpuTextFile.becomeFirstResponder()
    }
    

    
}















