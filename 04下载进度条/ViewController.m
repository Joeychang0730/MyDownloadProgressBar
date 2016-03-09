//
//  ViewController.m
//  04下载进度条
//
//  Created by apple on 15-6-7.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "SteveZProgressBarView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SteveZProgressBarView* progressBar;

@end

@implementation ViewController

- (IBAction)sliderValueChanged:(UISlider*)sender
{
    // 把当前用户选择的slider的值, 传递给自定义view
    self.progressBar.progress = sender.value;
    // NSLog(@"%f", sender.value);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
