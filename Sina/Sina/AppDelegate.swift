//
//  AppDelegate.swift
//  Sina
//
//  Created by shasha on 15/11/6.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 1.创建窗口
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // 2.设置窗口根控制器
        window?.rootViewController = MainViewController()
        // 3.显示窗口
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

