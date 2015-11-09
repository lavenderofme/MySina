//
//  VisitorView.swift
//  Sina
//
//  Created by shasha on 15/11/9.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    /** 中间的文字 */
    @IBOutlet weak var titleLabel: UILabel!
    /** 登录按钮 */
    @IBOutlet weak var loginButton: UIButton!
    /** 注册按钮 */
    @IBOutlet weak var registerButton: UIButton!
    /** 大图片 */
    @IBOutlet weak var imageVIew: UIImageView!
    /** 转盘 */
    @IBOutlet weak var circleView: UIImageView!
    
    
    // MARK: - 外部控制方法
    func setupVisitorInfo(imageNamed: String?, title:String)
    {
        guard let name = imageNamed else {
            
            starAnimation()
            return
        }
        imageVIew.image = UIImage(named: name)
        titleLabel.text = title
        circleView.hidden = true
    }
    
    /** 快速创建方法 */
    class func visitorView() -> VisitorView
    {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    
    // MARK: - 内部控制方法
    func starAnimation(){
        // 1.创建动画对象
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 10.0
        anim.repeatCount = MAXFLOAT
        
        // 告诉系统不要随便给我移除动画, 只有当控件销毁的时候才需要移除
        anim.removedOnCompletion = false
        // 3.将动画添加到图层
        circleView.layer.addAnimation(anim, forKey: nil)
    }
}
