//
//  UIViewController+Orientation.swift
//  Page
//
//  Created by 风起兮 on 2019/11/13.
//  Copyright © 2019 风起兮. All rights reserved.
//

import UIKit

public protocol Orientation: class {
    var openAutorotate: Bool { get set }
}

fileprivate var _openAutorotate: String = "InterfaceOrientation._openAutorotate"

extension UIViewController: Orientation {
    
    public var openAutorotate: Bool {
        get {
            guard let autorotate = objc_getAssociatedObject(self, &_openAutorotate) as? Bool else {
                return false
            }
            return autorotate
        }
        set {
            objc_setAssociatedObject(self, &_openAutorotate, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}


extension UIViewController { 
    
    /*
    
    var shouldAutorotate: Bool {
        return false
    }
    
    var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
     
 */
}

public extension UIDeviceOrientation {
    
    var interfaceOrientation: UIInterfaceOrientation {
        
        switch self {
        case .portrait:
            return .portrait
        case .portraitUpsideDown:
            return .portraitUpsideDown
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        default:
            return .unknown
        }
    }
    
}

public extension UIViewController {
    
    class var interfaceOrientation: UIInterfaceOrientation {
        return UIDevice.current.orientation.interfaceOrientation
    }
    
    class func setOrientation(_ orientation: UIInterfaceOrientation) {
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
}

public extension UIDevice {
    
    class func setOrientation(_ orientation: UIDeviceOrientation) {
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
}
