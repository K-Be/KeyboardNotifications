//
//  ViewController.m
//  KeyboardNotifications
//
//  Created by Andrew Romanov on 17/10/2017.
//  Copyright © 2017 RAV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UITextField* textField;

- (IBAction)compliteEdition:(id)sender;

@end


@interface ViewController (Private)

- (void)_printNotificationInformation:(NSNotification*)notification;

@end


@interface ViewController (Notifications)

- (void)_subscribeToNotifications;
- (void)_unsubscribeFromNotifications;
- (void)_UIKeyboardWillShowNotification:(NSNotification*)notification;
- (void)_UIKeyboardDidShowNotification:(NSNotification*)notification;
- (void)_UIKeyboardWillHideNotification:(NSNotification*)notification;
- (void)_UIKeyboardDidHideNotification:(NSNotification*)notification;
- (void)_UIKeyboardWillChangeFrameNotification:(NSNotification*)notification;
- (void)_UIKeyboardDidChangeFrameNotification:(NSNotification*)notification;

- (void)_unsubscribeFromNotificationsInList:(NSArray<NSNotificationName>*)notifications;

@end


@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self _subscribeToNotifications];
}


#pragma mark Actions
- (IBAction)compliteEdition:(id)sender
{
	[self.textField resignFirstResponder];
}


- (void)dealloc
{
	[self _unsubscribeFromNotifications];
}

@end


#pragma mark -
@implementation ViewController (Private)

- (void)_printNotificationInformation:(NSNotification*)notification
{
	NSLog(@"Notification withName: %@ , \n userInfo: %@ \n***************", notification.name, notification.userInfo);
}

@end


#pragma mark -
@implementation ViewController (Notifications)

- (void)_subscribeToNotifications
{
	[self _unsubscribeFromNotifications];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_UIKeyboardWillShowNotification:)
																							 name:UIKeyboardWillShowNotification
																						 object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(_UIKeyboardDidShowNotification:)
																							 name:UIKeyboardDidShowNotification
																						 object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(_UIKeyboardWillHideNotification:)
																							 name:UIKeyboardWillHideNotification
																						 object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(_UIKeyboardDidHideNotification:)
																							 name:UIKeyboardDidHideNotification
																						 object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(_UIKeyboardWillChangeFrameNotification:)
																							 name:UIKeyboardWillChangeFrameNotification
																						 object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
																					 selector:@selector(_UIKeyboardDidChangeFrameNotification:)
																							 name:UIKeyboardDidChangeFrameNotification
																						 object:nil];
}


- (void)_unsubscribeFromNotifications
{
	NSArray<NSNotificationName>* notifications = @[UIKeyboardWillShowNotification,
																								 UIKeyboardDidShowNotification,
																								 UIKeyboardWillHideNotification,
																								 UIKeyboardDidHideNotification,
																								 UIKeyboardWillChangeFrameNotification,
																								 UIKeyboardDidChangeFrameNotification];
	[self _unsubscribeFromNotificationsInList:notifications];
}


- (void)_UIKeyboardWillShowNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_UIKeyboardDidShowNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_UIKeyboardWillHideNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_UIKeyboardDidHideNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_UIKeyboardWillChangeFrameNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_UIKeyboardDidChangeFrameNotification:(NSNotification*)notification
{
	[self _printNotificationInformation:notification];
}


- (void)_unsubscribeFromNotificationsInList:(NSArray<NSNotificationName>*)notifications
{
	[notifications enumerateObjectsUsingBlock:^(NSNotificationName  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[[NSNotificationCenter defaultCenter] removeObserver:self name:obj object:nil];
	}];
}

@end
