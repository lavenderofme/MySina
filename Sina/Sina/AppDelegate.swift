//
//  AppDelegate.swift
//  Sina
//
//  Created by shasha on 15/11/6.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

@UIApplicationMain // 相当于 main 函数, 是程序的入口
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 全局有效的设置一般在程序一启动就设置,否则不知道何时有效,一般在 AppDelegate中设置
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        // 1.创建窗口
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // 2.设置窗口根控制器
        window?.rootViewController = MainViewController()
        // 3.显示窗口
        window?.makeKeyAndVisible()
        
        LQYLog(1)
        LQYLog("wo")
        LQYLog(11.09)
        
        return true
    }

    /*
    自定义LOG的目的:
    在开发阶段自动显示LOG
    在发布阶段自动屏蔽LOG

    print(__FUNCTION__)  // 打印所在的方法
    print(__LINE__)     // 打印所在的行
    print(__FILE__)     // 打印所在文件的路径

    方法名称[行数]: 输出内容
    */
    // T 相当于泛型,也就是说传什么就是什么
    func LQYLog<T>(message: T, method: String =  __FUNCTION__, line: Int = __LINE__)
    {
        
        #if DEBUG
        print("\(method)[\(line)]:\(message)")
        #endif
    }

}

