//
//  ProfileDetailViewController.h
//  twitter
//
//  Created by Anna Kuznetsova on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileDetailViewController : UIViewController

@property (nonatomic, strong) User *user;

@end

NS_ASSUME_NONNULL_END
