//
//  DiscoverViewController.swift
//  Sina
//
//  Created by shasha on 15/11/7.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !login {
            
            visitorView?.setupVisitorInfo("visitordiscover_image_message", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
            return
        }
    
    }

}
