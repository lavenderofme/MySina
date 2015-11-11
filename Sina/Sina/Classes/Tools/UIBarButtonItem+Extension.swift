//
//  UIBarButtonItem+Extension.swift
//  Sina
//
//  Created by shasha on 15/11/11.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

extension UIBarButtonItem
{
    convenience init(imageNamed: String, target: AnyObject, action: Selector)
    {
        
        let button = UIButton(type: UIButtonType.Custom)
        button.setImage(UIImage(named: imageNamed), forState: UIControlState.Normal)
        button.setImage(UIImage(named: imageNamed + "_highlighted"), forState: UIControlState.Highlighted)
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        self.init(customView:button)
        
    }
}
