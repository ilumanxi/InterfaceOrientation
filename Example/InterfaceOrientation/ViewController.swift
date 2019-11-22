//
//  ViewController.swift
//  InterfaceOrientation
//
//  Created by 风起兮 on 2019/11/13.
//  Copyright © 2019 风起兮. All rights reserved.
//

import UIKit
import InterfaceOrientation

extension UIDevice {
    
    static let UIDeviceOrientationRotateAnimatedUserInfoKey: String = "UIDeviceOrientationRotateAnimatedUserInfoKey" // NSNumber of Int
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var videoContainerView: UIView!
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChangeNotification), name: .UIDeviceOrientationDidChange, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
    }

    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
    }
    
    @objc func orientationDidChangeNotification(_ notification: Notification) {
        
        
        guard let rotateAnimated = notification.userInfo?[UIDevice.UIDeviceOrientationRotateAnimatedUserInfoKey] as? NSNumber, openAutorotate == true else {
            return
        }
        
        print(rotateAnimated)
        
        if UIDevice.current.orientation.isPortrait {
            videoContainerView.addSubview(videoView)
            NSLayoutConstraint.activate([
                videoView.leadingAnchor.constraint(equalTo: videoContainerView.leadingAnchor),
                videoView.trailingAnchor.constraint(equalTo: videoContainerView.trailingAnchor),
                videoView.topAnchor.constraint(equalTo: videoContainerView.topAnchor),
                videoView.bottomAnchor.constraint(equalTo: videoContainerView.bottomAnchor)
            ])
        }
        
        if UIDevice.current.orientation.isLandscape {
            let window = self.view.window!
            window.addSubview(self.videoView)
            NSLayoutConstraint.activate([
                videoView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                videoView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                videoView.topAnchor.constraint(equalTo: window.topAnchor),
                videoView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])
        }
        
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
    
    @available(iOS 11.0, *)
    override func prefersHomeIndicatorAutoHidden() -> Bool {
         if openAutorotate && UIViewController.interfaceOrientation.isLandscape {
                return true
        }
        return false
    }
    
    @available(iOS 11.0, *)
    override func preferredScreenEdgesDeferringSystemGestures() -> UIRectEdge {
        return .all
    }
    
}
