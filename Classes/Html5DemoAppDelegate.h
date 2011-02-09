//
//  Html5DemoAppDelegate.h
//  Html5Demo
//
//  Created by dav on 2/8/11.
//  Copyright 2011 Lumos Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface Html5DemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

