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
        
        // 添加自控制器
        addChildControllers("HomeTableViewController",image:  "tabbar_home", title: "首页")
        addChildControllers("MessageViewController", image: "tabbar_message_center", title: "消息")
        addChildControllers("DiscoverViewController", image: "tabbar_discover", title: "发现")
        addChildControllers("ProfileViewController", image: "tabbar_profile", title: "我")
        
    }
    
    /** 添加自控制器 */
    func addChildControllers(childControllerName: String , image: String, title: String)
    {
        // 0.动态获取命名空间
        guard let nsp =  NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else
        {
            LQYLog("没有获取到命名空间")
            return
        }
        
        // 1.通过字符串创建一个类
        // 在 Swift 中, 如果向通过一个AnyClass来创建一个对象, 必须先明确这个类的类型
        let cls: AnyClass? = NSClassFromString(nsp + "." + childControllerName)
        
        // 2.通过 class 创建一个类
        // 在Swift中如果向通过一个AnyClass来创建一个对象, 必须先明确这个类的类型
        guard let vcCls = cls as? UITableViewController.Type else
        {
            LQYLog("没有获得命名空间")
            return
        }
        let childController = vcCls.init()
        
        
        // 3.1设置 tabBar 上的标题和图片
        childController.title = title
        childController.tabBarItem.image = UIImage(named:image)
        childController.tabBarItem.selectedImage = UIImage(named:image + "_highlighted")
        // 3.2包装一个导航控制器
        let nav = UINavigationController(rootViewController: childController)
        
        // 3.3将导航控制器添加到 UITabBarController
        addChildViewController(nav)
        
    }


}
