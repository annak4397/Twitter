//
//  User.m
//  twitter
//
//  Created by Anna Kuznetsova on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageURLString = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
        self.bannerImage = [NSURL URLWithString: dictionary[@"profile_banner_url"]];
        self.descriptionString = dictionary[@"description"];
        self.locationString = dictionary[@"location"];
        self.joinedString = dictionary[@"created_at"];
        self.linkString = dictionary[@"url"];
        self.followingNumber = [dictionary[@"friends_count"] intValue];
        self.followersNumber = [dictionary[@"followers_count"] intValue];
    }
    return self;
}
/*+ (NSMutableArray *)userWithArray:(NSArray *)dictionaries{
    NSMutableArray *userArray = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        User *userDic = [[User alloc] initWithDictionary:dictionary];
        [userArray addObject:userDic];
    }
    return userArray;
}*/

@end
