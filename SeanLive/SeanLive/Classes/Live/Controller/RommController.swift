//
//  RommController.swift
//  SeanLive
//
//  Created by  luoht on 2017/7/24.
//  Copyright © 2017年 Sean. All rights reserved.
//

import UIKit

private let chatToolViewHeight : CGFloat = 44
private let giftViewHeight = kScreenH * 0.5
private let chatContenViewHeight = 200


class RommController: UIViewController,Emitterable,SeanChatToolViewDelegate {
    var anchorModel : AnchorModel!
    fileprivate lazy var chatToolView : SeanChatToolView = SeanChatToolView.loadFromNib()
    
    fileprivate var giftView :GiftListView = GiftListView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        configUI()
        //监听键盘弹起的通知
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChangeFrame(note: )), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    deinit {
        print("我挂了")
    }
}

extension RommController {
    func configUI() {
        configBottomView()
        
    }
    
    
    func configBottomView() {
        // 设置聊天框的位置
        chatToolView.frame = CGRect(x: CGFloat(0), y: kScreenH, width: kScreenW, height: chatToolViewHeight)
        chatToolView.delegate = self
        view.addSubview(chatToolView)
        
        // MARK:- 设置礼物视图
        giftView.frame = CGRect(x: 0, y: view.bounds.height, width: kScreenW, height: giftViewHeight)
        giftView.autoresizingMask = [.flexibleWidth,.flexibleTopMargin]
        
        // MARK:- 礼物视图赠送点击
        giftView.sendGifBlock = { [weak self] (model : GiftModel) in
                print(model.subject)
            UIView.animate(withDuration: 0.25) {
                self?.giftView.frame.origin.y = kScreenH
            }
        }
        
        view.addSubview(giftView)
    }
}


// MARK:- 监听键盘弹出
extension RommController {
    
    func keyBoardWillChangeFrame( note : Notification) {
        let duration = note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let endFrame = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let inputY = endFrame.origin.y - chatToolViewHeight
        
        UIView.animate(withDuration: duration) {
//            UIView.setAnimationCurve(UIViewAnimationCurve(rawValue: 7)!)
            UIView.setAnimationCurve(.easeIn)
            
            let endY = inputY == (kScreenH - chatToolViewHeight) ? kScreenH : inputY
            self.chatToolView.frame.origin.y = endY
        }
        
    }
 
}



// MARK:- 事件监听
extension RommController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        chatToolView.inpuTextFile.resignFirstResponder()
        UIView.animate(withDuration: 0.25) { 
            self.giftView.frame.origin.y = kScreenH
        }
    }
    
    @IBAction func foucnBtnClick(_ sender: Any) {
        
    }
    
    
    @IBAction func peopleBtnCilck(_ sender: Any) {
        
    }
    
    
    @IBAction func closeBtnClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bottomBtnClick(_ sender: UIButton) {
        
        switch sender.tag {
           
        case 0:
            print("聊天")
//            chatToolView.emoticonBtn.isSelected = false
            chatToolView.inputFileBecomeFirstResponder()
        case 1:
            print("分享")
        case 2:
            print("礼物")
            UIView.animate(withDuration: 0.25, animations: {
                self.giftView.frame.origin.y = kScreenH - giftViewHeight
            })
        case 3:
            print("更多")
        case 4:
            print("喜欢")
            sender.isSelected = !sender.isSelected
            let point = CGPoint(x: sender.center.x, y:view.frame.height - sender.bounds.height * 0.5)
            sender.isSelected ? startEmittering(point: point) : stopEmittering()
        default:
            fatalError("未处理的按钮")
        }
    }
    
    func seanChatToolViewSendMessage(toolView: SeanChatToolView, message: String) {
         print(message)
    }
    
  
}
















