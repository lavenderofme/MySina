//
//  BaseViewController.swift
//  Sina
//
//  Created by shasha on 15/11/9.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    var login: Bool = false
    var visitorView: VisitorView?

    override func loadView()
    {
        super.loadView()
        login ? super.loadView() : setupVisitorView()
    }
    
    func setupVisitorView()
    {
        // 1.添加访客视图
        visitorView = VisitorView.visitorView()
        view = visitorView
        
        // 2.监听按钮点击
        visitorView?.registerButton.addTarget(self, action: Selector("registerButtonClick"), forControlEvents: UIControlEvents.TouchUpInside)
        visitorView?.loginButton.addTarget(self, action: Selector("loginButtonClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        // 3.添加导航栏按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("registerButtonClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("loginButtonClick"))
    }
    
    // MARK: - 监听按钮点击
    @objc private func registerButtonClick()
    {
        LQYLog("")
    }
    @objc private func loginButtonClick()
    {
        LQYLog("")
    }
}
