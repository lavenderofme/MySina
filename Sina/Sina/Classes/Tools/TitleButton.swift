//
//  TitleButton.swift
//  Sina
//
//  Created by shasha on 15/11/11.
//  Copyright © 2015年 shasha. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    /** 自定义控件,通过代码创建底层会调用 init(frame: CGRect) */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 取消高亮状态
        adjustsImageWhenHighlighted = false
        setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        setTitle("lavenderofme  ", forState: UIControlState.Normal)
        
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Selected)
        sizeToFit()
    }

    /** 通过SB/XIB创建会调用 */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** 通过 layoutSubviews 布局子控件 */
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.bounds.size.width
        
    }
    

}
