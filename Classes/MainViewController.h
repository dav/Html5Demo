//
//  MainViewController.h
//  Html5Demo
//
//  Created by dav on 2/8/11.
//  Copyright 2011 Lumos Labs, Inc. All rights reserved.
//

#import "FlipsideViewController.h"
#import <iAd/iAd.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, ADBannerViewDelegate> {
  IBOutlet UIWebView* webView;
  IBOutlet UIButton* button;
  IBOutlet ADBannerView* adBanner;
}

- (IBAction)buttonTapped:(id)sender;
- (IBAction)showInfo:(id)sender;

@end
