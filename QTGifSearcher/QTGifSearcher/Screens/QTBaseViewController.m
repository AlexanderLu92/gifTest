//
//  QTBaseViewController.m
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import "QTBaseViewController.h"

@interface QTBaseViewController ()

@property(nonatomic, assign) CGSize keyboardSize;

@end

@implementation QTBaseViewController // Class for something base functionality

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerForNotifications];
}

- (void)dealloc {
    [self unregisterForNotifications];
}

#pragma mark - Private methods

- (void)registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
}

- (void)hideKeyboard {
        [self.view endEditing:YES];
}

#pragma mark - Notifications

- (void)keyboardWillShow:(NSNotification *)notification {
    CGFloat keyboardHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat keyboardWidth = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.width;
    if ([UIDevice currentDevice].systemVersion.floatValue < 8 &&
        UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        
        keyboardHeight = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.width;
        keyboardWidth = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    }
    self.keyboardSize = CGSizeMake(keyboardWidth, keyboardHeight);
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.keyboardSize = CGSizeMake(0.0, 0.0);
}

@end
