//
//  FirstViewController.m
//  Listen Quran with Urdu Translation
//
//  Created by Muhammad Asif on 7/15/13.
//  Copyright (c) 2013 Muhammad Asif. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
       
    [self createButtons];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stop:(id)sender {
    
    [wView loadHTMLString:@"" baseURL:nil];
}

- (void)createButtons {
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    
    NSUInteger i;
    int xCoord=0;
    int yCoord=0;
    int buttonWidth=screenSize.width;
    int buttonHeight=50;
    int buffer = 3;
    
    for (i = 1; i <= 114; i++)
    {
    }
    
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *filePath = [mainBundle pathForResource:@"quran_urdu" ofType:@"txt"];
    
    NSString* content = [NSString stringWithContentsOfFile:filePath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSMutableArray * fileLines = [[NSMutableArray alloc] initWithArray:[content componentsSeparatedByString:@"\n"] copyItems: YES];
    
    NSArray *tokens;
    NSString *sura;
    for (NSString *line in fileLines) {
        
        tokens = [line componentsSeparatedByString:@"\t"];
        sura = [[[tokens objectAtIndex:0] componentsSeparatedByString:@"."] objectAtIndex:0];
        
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [aButton setBackgroundColor:[UIColor blackColor]];
        [aButton setTitle:[NSString stringWithFormat:@"%@",sura] forState:UIControlStateNormal];
        aButton.frame     = CGRectMake(xCoord, yCoord,buttonWidth,buttonHeight );
        [aButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:aButton];
        
        yCoord += buttonHeight + buffer;

               
    }
   
    [self.scrollView setScrollEnabled:YES];
    
    CGFloat scrollViewHeight = 0.0f;
    for (UIView* view in self.scrollView.subviews)
    {
        scrollViewHeight += view.frame.size.height;
    }
    
    [self.scrollView setContentSize:(CGSizeMake(320, scrollViewHeight+(114*buffer)))];
 
}


-(IBAction)buttonPressed:(id)sender
{
    
    //
    NSString *title = [[sender titleLabel] text];
    title = [title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *stream = [NSString stringWithFormat:@"http://download2.quranurdu.com/Al Quran with Urdu Translation by Imam Al Sadais and Shraim/%@.mp3",title];
    
    //encoding url
    stream = [stream stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //[self showMessage:stream];
    NSURL *url = [NSURL URLWithString:stream];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [wView loadRequest:request];
    
    
   }


-(void)showMessage:(NSString *)msg
{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Info"
                                                   message: msg
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    
    
    [alert show];

    
}
@end
