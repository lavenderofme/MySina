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
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        // 添加自控制器
        addChildControllers(HomeTableViewController(), image: "tabbar_home", title: "首页")
        addChildControllers(MessageViewController(), image: "tabbar_message_center", title: "消息")
        addChildControllers(DiscoverViewController(), image: "tabbar_discover", title: "发现")
        addChildControllers(ProfileViewController(), image: "tabbar_profile", title: "我")
        
    }
    
    /** 添加自控制器 */
    func addChildControllers(childController:UIViewController, image: String, title: String)     {
        
        // 设置 tabBar 上的标题和图片
        childController.title = title
        childController.tabBarItem.image = UIImage(named:image)
        childController.tabBarItem.selectedImage = UIImage(named:image + "_highlighted")
        // 包装一个导航控制器
        let nav = UINavigationController(rootViewController: childController)
        
        addChildViewController(nav)
        
    }


}
