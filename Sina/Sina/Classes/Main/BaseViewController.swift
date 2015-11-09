//
//  BaseViewController.swift
//  Sina
//
//  Created by shasha on 15/11/9.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    private var login: Bool = false
    
    override func loadView()
    {
        super.loadView()
        
        login ? super.loadView() : setupVisitorView()
    }
    
    func setupVisitorView()
    {
        let visitorView = VisitorView.visitorView()
        view = visitorView
    }
}
