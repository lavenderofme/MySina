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
        
        if !login {
         
            visitorView?.setupVisitorInfo(nil, title: "")
            return
        }
        
        // 添加导航栏上的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_friendattention", target: self, action: Selector("leftBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
    }
    
    @objc func leftBtnClick()
    {
        LQYLog("")
    }
    @objc func rightBtnClick()
    {
        LQYLog("")
    }

}
