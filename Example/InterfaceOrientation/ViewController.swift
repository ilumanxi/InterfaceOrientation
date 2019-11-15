//
//  ViewController.swift
//  InterfaceOrientation
//
//  Created by 风起兮 on 2019/11/13.
//  Copyright © 2019 风起兮. All rights reserved.
//

import UIKit
import InterfaceOrientation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func didSelectedOrientation(_ sender: UISegmentedControl) {
        openAutorotate = true
        switch sender.selectedSegmentIndex {
        case 0:
            UIViewController.setOrientation(.portrait)
        case 1:
            UIViewController.setOrientation(.portraitUpsideDown)
        case 2:
            UIViewController.setOrientation(.landscapeLeft)
        case 3:
           UIViewController.setOrientation(.landscapeRight)
        default:
            UIViewController.setOrientation(.portrait)
        }
    }
    
    override var shouldAutorotate: Bool {
        return openAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if shouldAutorotate {
            return .all
        }
        return super.supportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    /*
    override var prefersHomeIndicatorAutoHidden: Bool {

        if openAutorotate && UIViewController.interfaceOrientation.isLandscape {
            return true
        }
        return false
    }
    */
    
    /*
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return .all
    }
 */
}

