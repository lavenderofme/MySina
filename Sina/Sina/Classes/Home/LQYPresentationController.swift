//
//  LQYPresentationController.swift
//  Sina
//
//  Created by shasha on 15/11/11.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class LQYPresentationController: UIPresentationController {

    /** 布局被弹出的控制器 */
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        // containerView 容器视图 (所有被展现的内容都再容器视图上)
        // presentedView() 被展现的视图(当前就是弹出菜单控制器的view)
        
        // 1.添加一个蒙版
        containerView?.insertSubview(cover, atIndex: 0)
        cover.frame = containerView!.bounds
        
        // 2.修改被展现控件的尺寸
        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
    }
    
    // MARK: - 懒加载
    private lazy var cover: UIView = {
        
        // 1.创建蒙版
        let coverView = UIView()
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        
        // 2.添加手势
        coverView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("coverClick")))
        
        return coverView
        
    }()
    
    // MARK: - 内部控制方法
    @objc func coverClick()
    {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

