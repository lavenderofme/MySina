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
        
        // 1.加载 JSON 数据
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)!
        let data = NSData(contentsOfFile: path)!
        
        /* throws是XCode7最大的变化, 异常处理机制
           1.do catch的作用: 一旦方法抛出异常, 那么就会执行catch后面{}中的内容, 如果没有抛出异常, 那么catch后面{}中的内容不执行
                1.try : 正常处理异常, 一旦有异常就执行catch
                2.try!: 强制处理异常(忽略异常),也就是说告诉系统一定不会发生异常, 如果真的发生了异常, 那么程序会崩溃
                3.try?: 忽略异常, 告诉系统可能有异常也可能没有异常, 如果发生异常返回值就是nil, 如果没有发生异常, 会将返回值包装为一个可选类型的值
           2.开发中推举使用try? 和 try , 不推荐使用try!
        */

        guard let objc = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) else
        {
            LQYLog("没有 JSON 数据")
            // 添加自控制器
            addChildControllers("HomeViewController",image:  "tabbar_home", title: "首页")
            addChildControllers("MessageViewController", image: "tabbar_message_center", title: "消息")
            addChildControllers("DiscoverViewController", image: "tabbar_discover", title: "发现")
            addChildControllers("ProfileViewController", image: "tabbar_profile", title: "我")
            return
        }
        
        // 2.根据json文件返回的数据加载控制器
        for dict in objc as! [[String : AnyObject]]
        {
            addChildControllers(dict["vcName"] as! String, image:dict["imageName"] as! String , title: dict["title"] as! String)
        }
        
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
        let cls: AnyClass? = NSClassFromString( nsp + "." + childControllerName)
        
        // 2.通过 class 创建一个类
        // 在Swift中如果向通过一个AnyClass来创建一个对象, 必须先明确这个类的类型
        guard let vcCls = cls as? UITableViewController.Type else
        {
            LQYLog("AnyClass没有值")
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
