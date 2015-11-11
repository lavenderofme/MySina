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
        popoverVc.transitioningDelegate = self
        
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
    
    private var isPresent = false
}

let LQYPopoverViewControllerShowClick = "LQYPopoverViewControllerShowClick"
let LQYPopoverViewControllerDismissClick = "LQYPopoverViewControllerDismissClick"

// MARK: -UIViewControllerTransitioning代理方法
extension HomeViewController: UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    
    // MARK: -UIViewControllerTransitioning代理方法
    /*
    该方法用于告诉系统谁来负责自定义转场
    第一个参数: 被展现的控制
    第二个参数: 发起的控制器
    */
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return LQYPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    /** 告诉系统谁来负责展现的样式 */
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        isPresent = true
        NSNotificationCenter.defaultCenter().postNotificationName(LQYPopoverViewControllerShowClick, object: self)
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(LQYPopoverViewControllerDismissClick, object: self)
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    /// 该方法用于告诉系统展现或者消失动画的时长
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.5
    }
    
    /// 无论是展现还是消失都会调用这个方法
    /// 我们需要在这个方法中告诉系统, 菜单如何展现
    /// 注意点: 只要实现了这个方法, 那么系统就不会再管控制器如何弹出和消失了, 所有的操作都需要我们自己做
    // transitionContext: 里面就包含了我们所有需要的参数
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent
        {
            // 展现
            // 1.拿到菜单
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            // 2.添加到containerView
            transitionContext.containerView()?.addSubview(toView!)
            
            // 3.设置动画
            toView?.transform = CGAffineTransformMakeScale(1.0, 0.0)
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                toView?.transform = CGAffineTransformIdentity
            })
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                toView?.transform = CGAffineTransformIdentity
                }, completion: { (_) -> Void in
                    
                    // 注意: 如果自定义转场动画, 那么必须告诉系统动画是否完成
                    transitionContext.completeTransition(true)
                    
            })
            
            
        }else {
            // 消失
            // 1.拿到菜单
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            // 注意: 以后如果使用CGFloat之后发现运行的结果和我们预期的结果不一致, 那么可以尝试修改CGFloat的值为一个很小的值
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                fromView?.transform = CGAffineTransformMakeScale(1.0, 0.0000001)
                }, completion: { (_) -> Void in
                    // 注意: 如果自定义转场动画, 那么必须告诉系统动画是否完成
                    transitionContext.completeTransition(true)
            })

        }
        
        
    }

    
}


