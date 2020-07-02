//
//  User.h
//  twitter
//
//  Created by Anna Kuznetsova on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSURL *profileImage;
@property (nonatomic, strong) NSURL *bannerImage;
@property (nonatomic, strong) NSString *descriptionString;
@property (nonatomic, strong) NSString *locationString;
@property (nonatomic, strong) NSString *joinedString;
@property (nonatomic, strong) NSString *linkString;
@property (nonatomic) int followingNumber;
@property (nonatomic) int followersNumber;




// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
//+ (NSMutableArray *)userWithArray:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
