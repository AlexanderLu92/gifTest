//
//  QTBaseViewController.h
//  QTGifSearcher
//
//  Created by Alexandr Luchenok on 31.07.16.
//  Copyright © 2016 Alexander Luchenok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTBaseViewController : UIViewController

@property(nonatomic, assign) BOOL hideKeyboardOnTap;
@property(nonatomic, assign, readonly) CGSize keyboardSize;

- (void)hideKeyboard; // fix for tableview
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;

@end
