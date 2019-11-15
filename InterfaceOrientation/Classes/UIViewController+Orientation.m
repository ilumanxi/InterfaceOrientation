//
//  UIViewController+Orientation.m
//  Page
//
//  Created by 风起兮 on 2019/11/13.
//  Copyright © 2019 风起兮. All rights reserved.
//

#import "UIViewController+Orientation.h"


@implementation UIViewController (Orientation)

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
