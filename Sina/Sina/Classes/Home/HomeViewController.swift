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
        
        if !login {
         
            visitorView?.setupVisitorInfo(nil, title: "")
            return
        }

    }

}
