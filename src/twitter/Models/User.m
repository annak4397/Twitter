//
//  User.m
//  twitter
//
//  Created by Anna Kuznetsova on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "User.h"
#import "DateTools.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        NSString *newString = [dictionary[@"profile_image_url_https"] stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        self.profileImage = [NSURL URLWithString:newString];
        self.bannerImage = [NSURL URLWithString: dictionary[@"profile_banner_url"]];
        self.descriptionString = dictionary[@"description"];
        self.locationString = dictionary[@"location"];
        
        NSString *createdAtOriginalString = dictionary[@"created_at"];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                // Configure the input format to parse the date string
                formatter.dateFormat = @"E MMM d HH:mm:ss Z y";
                // Convert String to Date
                NSDate *date = [formatter dateFromString:createdAtOriginalString];
                // Configure output format
                formatter.dateStyle = NSDateFormatterShortStyle;
                formatter.timeStyle = NSDateFormatterNoStyle;
                // Convert Date to String
                
                //self.createdAtOriginalString = createdAtOriginalString;
                //self.createdAtString = [formatter stringFromDate:date];
        
        self.joinedString = [formatter stringFromDate:date];
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
