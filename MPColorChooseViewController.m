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
    
    UIButton *down = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [down setTitle:@"<" forState:UIControlStateNormal];
    [down setFrame:CGRectMake(10, 135, 30, 30)];
    [down addTarget:self action:@selector(actionDown:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:down];
    
    UIButton *up = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [up setTitle:@">" forState:UIControlStateNormal];
    [up setFrame:CGRectMake(60, 135, 30, 30)];
    [up addTarget:self action:@selector(actionUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:up];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 230, 30)];
    [label setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:label];
}

-(void)actionDown:(id)sender{
    if(colorR == 0 || colorG == 0 || colorB == 0)
        return;
    
    colorR--;
    colorG--;
    colorB--;
    
    [((UISlider*)[self.view viewWithTag:100]) setValue:colorR];
    [((UISlider*)[self.view viewWithTag:101]) setValue:colorG];
    [((UISlider*)[self.view viewWithTag:102]) setValue:colorB];

    [self changeWasDid];

}

-(void)actionUp:(id)sender{
    
    if(colorR == 255 || colorG == 255 || colorB == 255)
        return;
    
    colorR++;
    colorG++;
    colorB++;
    
    [((UISlider*)[self.view viewWithTag:100]) setValue:colorR];
    [((UISlider*)[self.view viewWithTag:101]) setValue:colorG];
    [((UISlider*)[self.view viewWithTag:102]) setValue:colorB];
    
    [self changeWasDid];
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
    
    [self changeWasDid];
}

-(void)changeWasDid{
    
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
