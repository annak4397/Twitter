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
@property (nonatomic, strong) NSString *profileImageURLString;


// Create initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
//+ (NSMutableArray *)userWithArray:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
