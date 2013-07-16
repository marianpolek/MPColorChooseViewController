//
//  MPColorChooseViewController.h
//  Funny
//
//  Created by Marian Polek on 7/7/13.
//  Copyright (c) 2013 Marian Polek. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MPColorChooseDelegate <NSObject>

-(void)colorDidChanged:(UIColor*)color;

@end

@interface MPColorChooseViewController : UIViewController{
    
    id<MPColorChooseDelegate> _delegate;
    
    NSInteger colorR;
    NSInteger colorG;
    NSInteger colorB;
    
    UILabel *label;
}

@property (nonatomic, assign) id<MPColorChooseDelegate> delegate;

@end
