//
//  SVSSlider.m
//  tap2visit
//
//  Created by Виталий Сероштанов on 19.05.15.
//  Copyright (c) 2015 &#1042;&#1080;&#1090;&#1072;&#1083;&#1080;&#1081; &#1057;&#1077;&#1088;&#1086;&#1096;&#1090;&#1072;&#1085;&#1086;&#1074;. All rights reserved.
//

#import "SVSSlider.h"

@implementation SVSSlider
{
    UIView *shadowView;
    CGFloat sizeOneDivision;
}

-(instancetype) init{

    self = [super init];
    [self setDefaults];
    return self;
    
}


-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setDefaults];
    return self;

}


-(void) drawRect:(CGRect)rect
{
    sizeOneDivision = self.frame.size.width / _divisionCount;
    

    
    for (int i = 0; i<_divisionCount; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(sizeOneDivision*i, 0, sizeOneDivision, self.frame.size.height)];
        label.text = [NSString stringWithFormat:@"%i",i+1];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
    }
    
    if (!shadowView) shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [self addSubview:shadowView];
    
    shadowView.backgroundColor = _shadowColor == nil? [UIColor blueColor]: _shadowColor;
    shadowView.alpha = 0.5f;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(setCurrentValue:)];
    [self addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(setCurrentValue:)];
    [self addGestureRecognizer:tap];
    
    
}


-(void) setCurrentValue: (UIGestureRecognizer *) sender
{
    CGFloat x = [sender locationInView:self].x;
    CGFloat newSize;
    
    
    if (x<=0) {
        newSize = 0;
    } else
        if (x>self.frame.size.width) {
            return;
        } else  newSize = ((int)(x/sizeOneDivision) + 1)* (sizeOneDivision);
    
    shadowView.frame = CGRectMake(0, 0, newSize, self.frame.size.height);
    _value = (int)(shadowView.frame.size.width/sizeOneDivision);
    [_delegate slider:self ChangeValue:_value];
    
    
}



-(void) setDefaults
{
    _value = 0;
    self.backgroundColor = [UIColor whiteColor];
}




@end
