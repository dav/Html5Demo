//
//  MainViewController.m
//  Html5Demo
//
//  Created by dav on 2/8/11.
//  Copyright 2011 Lumos Labs, Inc. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];

  // Load HTML5 App
  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"html5" ofType:@"html"];
  NSData* htmlData = [NSData dataWithContentsOfFile:filePath];
  NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
  NSURL *baseURL = [[NSURL alloc] initFileURLWithPath:resourcePath isDirectory:YES];    
  [webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
  [baseURL release];
  
  // Disable button (will be enabled from javascript)
  button.enabled = NO;
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
}

#pragma mark -

- (IBAction)buttonTapped:(id)sender {
  NSLog(@"Button Tapped");
  NSString* jsString = [NSString stringWithFormat:@"setAlertMessage(' Sending at %@');", [NSDate date]];
  
  // Note: All js invoked with this method must take less than 10 seconds to run or it will be cut off unceremoniously
  [webView stringByEvaluatingJavaScriptFromString:jsString];
}

#pragma mark -
#pragma mark  ADBannerViewDelegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
  NSString* urlString = [[request URL] absoluteString];
  NSLog(@"JS -> iOS: %d %@", navigationType, urlString);

  /*
   enum {
   UIWebViewNavigationTypeLinkClicked,
   UIWebViewNavigationTypeFormSubmitted,
   UIWebViewNavigationTypeBackForward,
   UIWebViewNavigationTypeReload,
   UIWebViewNavigationTypeFormResubmitted,
   UIWebViewNavigationTypeOther
   };
   
   */
  
  // The initial load of the html resource  and the js call generates this
  if (navigationType == UIWebViewNavigationTypeOther) {
    if ([@"html5demo://enable-button" isEqualToString:urlString]) {
      NSLog(@"Enabling button");
      button.enabled = YES;
      return NO;
    }
    
    return YES;
  }
  
  return  NO;
}

@end
