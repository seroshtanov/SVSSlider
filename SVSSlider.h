//
//  SVSSlider.h
//  tap2visit
//
//  Created by Виталий Сероштанов on 19.05.15.
//  Copyright (c) 2015 &#1042;&#1080;&#1090;&#1072;&#1083;&#1080;&#1081; &#1057;&#1077;&#1088;&#1086;&#1096;&#1090;&#1072;&#1085;&#1086;&#1074;. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SVSSlider;

@protocol SVSSliderDelegate <NSObject>

-(void) slider: (SVSSlider *) slider ChangeValue: (int) value;

@end


@interface SVSSlider : UIControl

@property (nonatomic) int divisionCount;
@property (nonatomic) int value;
@property (nonatomic, strong) UIColor *shadowColor;
@property (strong, nonatomic) id <SVSSliderDelegate> delegate;
@property (nonatomic) BOOL enableLables;


@end
