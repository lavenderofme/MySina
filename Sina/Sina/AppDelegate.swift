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
        
        // 1.设置全局外观
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        
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

