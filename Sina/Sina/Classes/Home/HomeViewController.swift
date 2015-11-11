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
        
        // 1.判断是否登录
        if !login {
         
            visitorView?.setupVisitorInfo(nil, title: "")
            return
        }
        
        // 2.初始化导航条
        setupNav()
        
        
    }
    
    // MARK: - 内部控制方法
    /** 初始化导航条 */
    private func setupNav()
    {
        // 1.添加导航栏上的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_friendattention", target: self, action: Selector("leftBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
        
        // 2.标题按钮
        let titleButton = TitleButton()
        titleButton.addTarget(self, action: Selector("titleButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        navigationItem.titleView = titleButton
    }
    
    @objc func leftBtnClick()
    {
        LQYLog("")
    }
    @objc func rightBtnClick()
    {
        LQYLog("")
    }

    @objc func titleButton(button:UIButton)
    {
        // 1.切换按钮的状态
        button.selected = !button.selected
        
        // 2.创建菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let popoverVc = sb.instantiateInitialViewController()!
        
        // 2.1设置转场的代理
        popoverVc.transitioningDelegate = self
        
        // 2.2设置转场样式
        popoverVc.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // 3.显示菜单
        self.presentViewController(popoverVc, animated: true, completion: nil)
    }
}

// MARK: -UIViewControllerTransitioning代理方法
extension HomeViewController: UIViewControllerTransitioningDelegate
{
    /*
    该方法用于告诉系统谁来负责自定义转场
    第一个参数: 被展现的控制
    第二个参数: 发起的控制器
    */
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return LQYPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
}
