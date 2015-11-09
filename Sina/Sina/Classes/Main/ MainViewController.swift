//
//  MainViewController.swift
//  Sina
//
//  Created by shasha on 15/11/7.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
 

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(composeButton)
        
        let width = UIScreen.mainScreen().bounds.width / CGFloat(childViewControllers.count)
        let height = composeButton.bounds.height
        let y: CGFloat = 0
        
        composeButton.frame = CGRectMake(width * 2, y, width, height)
    }
    
    // MARK: - 内部控制方法
    func composeButtonClick()
    {
        LQYLog("")
        
    }
    
   
    // MARK: - 懒加载
    private lazy var composeButton: UIButton = {
        let btn = UIButton(imageNamed: "tabbar_compose_icon_add", backgroundImage: "tabbar_compose_button")
        btn.addTarget(self, action: Selector("composeButtonClick"), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    
    }()
}
