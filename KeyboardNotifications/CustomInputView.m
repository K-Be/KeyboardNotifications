//
//  CustomInputView.m
//  KeyboardNotifications
//
//  Created by Andrew Romanov on 18/10/2017.
//  Copyright © 2017 RAV. All rights reserved.
//

#import "CustomInputView.h"

@implementation CustomInputView

- (instancetype)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
	{
		UILabel* label = [[UILabel alloc] initWithFrame:self.bounds];
		label.text = @"Custom Input";
		label.backgroundColor = [UIColor clearColor];
		label.userInteractionEnabled = NO;
		
		[self addSubview:label];
		label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
		
		self.backgroundColor = [UIColor redColor];
	}
	
	return self;
}


- (CGSize)intrinsicContentSize
{
	return CGSizeMake(UIViewNoIntrinsicMetric, 150.0);
}


@end
