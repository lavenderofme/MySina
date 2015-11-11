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
        
        // 3.注册监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("titleButtonChange"), name: LQYPopoverViewControllerShowClick, object: nil)
         NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("titleButtonChange"), name: LQYPopoverViewControllerDismissClick, object: nil)
        
        
    }
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - 内部控制方法
    /** 初始化导航条 */
    private func setupNav()
    {
        // 1.添加导航栏上的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_friendattention", target: self, action: Selector("leftBtnClick"))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageNamed: "navigationbar_pop", target: self, action: Selector("rightBtnClick"))
        
        // 2.添加标题按钮
        navigationItem.titleView = titleButton
    }
    
    // MARK: - 内部控制方法
    @objc func leftBtnClick()
    {
        LQYLog("")
    }
    @objc func rightBtnClick()
    {
        LQYLog("")
    }

    /** 设置按钮的箭头方向 */
    @objc func titleButtonChange()
    {
        // 1.切换按钮的状态
        titleButton.selected = !titleButton.selected

    }
    
    @objc func titleButton(button:UIButton)
    {
        // 1.切换按钮的状态
       // button.selected = !button.selected
        
        // 2.创建菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let popoverVc = sb.instantiateInitialViewController()!
        
        // 2.1设置转场的代理
        popoverVc.transitioningDelegate = popoverManager
        
        // 2.2设置转场样式
        popoverVc.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // 3.显示菜单
        self.presentViewController(popoverVc, animated: true, completion: nil)
    }
    
    // MARK: - 懒加载
    private lazy var titleButton: UIButton =  {
        
        let titleButton = TitleButton()
        titleButton.addTarget(self, action: Selector("titleButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        return titleButton
        
        }()
    
    
    /** 负责自定义转场的对象 */
    private lazy var popoverManager: PopoverAnimationManager = {
        let popoverManager = PopoverAnimationManager()
        popoverManager.presentedFrame = CGRect(x: 100, y: 56, width: 200, height: 300)
        return popoverManager
        
    }()
}




