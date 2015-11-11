//
//  HomeTableViewController.swift
//  Sina
//
//  Created by shasha on 15/11/7.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.判断是否登录
        if !login {
         
            visitorView?.setupVisitorInfo(nil, title: "")
            return
        }
        
        // 2.初始化导航条
        setupNav()
        
        
    }
    
    /** 初始化导航条 */
    private func setupNav()
    {
        // 1.添加导航栏上的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_friendattention", target: self, action: Selector("leftBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
        
        // 2.标题按钮
        let titleButton = TitleButton()
        titleButton.addTarget(self, action: Selector("titleButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        navigationItem.titleView = titleButton
    }
    
    @objc func leftBtnClick()
    {
        LQYLog("")
    }
    @objc func rightBtnClick()
    {
        LQYLog("")
    }

    @objc func titleButton(button:UIButton)
    {
        // 切换按钮的状态
        button.selected = !button.selected
        LQYLog("")
    }
}
