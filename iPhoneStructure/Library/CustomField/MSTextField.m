//
//  MSTextField.m
//  BasicStructure
//
//  Created by Marvin on 31/08/13.
//  Copyright (c) 2013 MFMA. All rights reserved.
//

#import "MSTextField.h"

@implementation MSTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)awakeFromNib{
    NSString *fontName = self.font.fontName;
    if([fontName containsString:@"Regular"])
        self.font = [UIFont fontWithName:@"Roboto-Regular" size:self.font.pointSize];
    else if([fontName containsString:@"Bold"])
        self.font = [UIFont fontWithName:@"Roboto-Bold" size:self.font.pointSize];
    else if([fontName containsString:@"Medium"])
        self.font = [UIFont fontWithName:@"Roboto-Medium" size:self.font.pointSize];
    else if([fontName containsString:@"Light"])
        self.font = [UIFont fontWithName:@"Roboto-Light" size:self.font.pointSize];
    else if([fontName containsString:@"Condensed Bold"])
        self.font = [UIFont fontWithName:@"Roboto-Bold" size:self.font.pointSize];
    else if([fontName containsString:@"Thin"])
        self.font = [UIFont fontWithName:@"Roboto-Thin" size:self.font.pointSize];
}

@end
