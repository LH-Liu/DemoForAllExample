//
//  BaseViewController.h
//  DemoForALLExample
//
//  Created by LH_Liu on 2017/10/20.
//  Copyright © 2017年 com.zhangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/** BackgroundColor */
@property (nonatomic, strong) UIColor *viewBackgroundColor;

/** 频道type */
@property (nonatomic, copy) NSString *type;

@end
