//
//  VisitorView.swift
//  Sina
//
//  Created by shasha on 15/11/9.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    class func visitorView() -> VisitorView
    {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
}
