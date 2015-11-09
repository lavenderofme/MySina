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
        /*
        // 1.创建窗口
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // 2.设置窗口根控制器
        window?.rootViewController = MainViewController()
        // 3.显示窗口
        window?.makeKeyAndVisible()
        */
        return true
    }

}
/** 自定义 print 函数 */
func LQYLog<T>(message: T, method: String =  __FUNCTION__, line: Int = __LINE__)
{
    
    #if DEBUG
        print("\(method)[\(line)]:\(message)")
    #endif
}

