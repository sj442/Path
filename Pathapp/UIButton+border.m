//
//  UIButton+border.m
//  Pathapp
//
//  Created by Sachin Jindal on 12/2/13.
//  Copyright (c) 2013 LittleAuk. All rights reserved.
//

#import "UIButton+border.h"

@implementation UIButton (border)

-(void)setButtonRoundedborder:(float) radius borderwidth:(float)borderwidth color:(UIColor*)color{
    
    CALayer *layer = [self layer];
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:radius];
    [layer setBorderWidth:borderwidth];
    [layer setBorderColor:[color CGColor]];
    
}

@end
