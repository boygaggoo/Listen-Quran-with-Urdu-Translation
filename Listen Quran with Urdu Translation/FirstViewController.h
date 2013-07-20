//
//  FirstViewController.h
//  Listen Quran with Urdu Translation
//
//  Created by Muhammad Asif on 7/15/13.
//  Copyright (c) 2013 Muhammad Asif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FirstViewController : UIViewController
{
    IBOutlet UIWebView *wView;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)stop:(id)sender;

-(void)createButtons;
-(IBAction)buttonPressed:(id)sender;

-(void)showMessage:(NSString *)msg;
@end
