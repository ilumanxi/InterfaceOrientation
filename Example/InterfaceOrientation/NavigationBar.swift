//
//  NavigationBar.swift
//  InterfaceOrientation_Example
//
//  Created by 风起兮 on 2019/11/18.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {

    var space: CGFloat = 30 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for view in subviews {
            if NSStringFromClass(view.classForCoder).contains("ContentView") {
                if #available(iOS 13.0, *) {
                    let margins = view.layoutMargins
                    view.frame = CGRect(
                        x: -margins.left + space,
                        y: margins.top,
                        width: margins.left + margins.right - space * 2 + view.frame.width,
                        height: margins.top + margins.bottom + view.frame.height
                    )
                } else {
                    view.layoutMargins = UIEdgeInsetsMake(0, space, 0, space)
                }
            }
        }
    }

}
