//
//  NavigationController.swift
//  InterfaceOrientation_Example
//
//  Created by 风起兮 on 2019/11/15.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override var shouldAutorotate: Bool {
        return topViewController!.openAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if topViewController!.shouldAutorotate {
            return .all
        }
        return super.supportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

}
