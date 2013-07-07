//
//  MPColorChooseViewController.m
//  Funny
//
//  Created by Marian Polek on 7/7/13.
//  Copyright (c) 2013 Marian Polek. All rights reserved.
//

#import "MPColorChooseViewController.h"

@interface MPColorChooseViewController ()

@end

@implementation MPColorChooseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    for(int i=0; i<3;i++){
        UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 10+(i*30), 230, 25)];
        [slider setTag:100+i];
        [slider setMinimumValue:0];
        [slider setMaximumValue:255];
        [slider addTarget:self action:@selector(colorChanged:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:slider];
    }
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 230, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
}

-(void)colorChanged:(id)sender{
    
    UISlider *slider = (UISlider*)sender;
    
    switch (slider.tag) {
        case 100:
            colorR = round(slider.value);
            break;
        case 101:
            colorG = round(slider.value);
            break;
        case 102:
            colorB = round(slider.value);
            break;
        default:
            break;
    }
    
    if(_delegate != nil){
        [_delegate colorDidChanged:[UIColor colorWithRed:colorR/255.0f green:colorG/255.0f blue:colorB/255.0f alpha:1]];
    }
    
    [label setText:[NSString stringWithFormat:@"R: %i, G: %i, B: %i",colorR, colorB, colorG]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
