//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TimelineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"got tweets");
            self.arrayOfTweets = (NSMutableArray *)tweets;
            NSLog(@"%@", self.arrayOfTweets);
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"getting number of rows");
    return [self.arrayOfTweets count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"creating cells");
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    //NSDictionary *tweetDictionary = self.arrayOfTweets[indexPath.row];
    //Tweet *tweet = [[Tweet alloc] initWithDictionary:tweetDictionary];
    //User *user = tweet.user;
    
    //set profile pic
    NSURL *profileImageURL = [NSURL URLWithString:tweet.user.profileImageURLString];
    [cell.profileImageView setImageWithURL:profileImageURL];
    
    cell.nameOfUserLabel.text = tweet.user.name;
    cell.usernameLabel.text = tweet.user.screenName;
    cell.dateOfTweetLabel.text = tweet.createdAtString;
    cell.tweetTextLabel.text = tweet.text;
    cell.likeNumberLabel.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    cell.retweetNumberLabel.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
