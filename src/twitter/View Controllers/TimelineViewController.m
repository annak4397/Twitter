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
#import "ComposeViewController.h"

@interface TimelineViewController () <ComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *arrayOfTweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refrereshControl;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Get timeline
    [self getTweets];
    
    self.refrereshControl = [[UIRefreshControl alloc] init];
    [self.refrereshControl addTarget:self action:@selector(getTweets) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refrereshControl atIndex:0];
    
}
- (void)getTweets{
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            self.arrayOfTweets = (NSMutableArray *)tweets;
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refrereshControl endRefreshing];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTweet:(Tweet *)tweet{
    [self.arrayOfTweets insertObject:tweet atIndex:0];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrayOfTweets count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    
    Tweet *tweet = self.arrayOfTweets[indexPath.row];
    cell.tweet = tweet;
    
    //set profile pic
    NSURL *profileImageURL = [NSURL URLWithString:tweet.user.profileImageURLString];
    [cell.profileImageView setImageWithURL:profileImageURL];
    
    cell.nameOfUserLabel.text = tweet.user.name;
    cell.usernameLabel.text = tweet.user.screenName;
    cell.dateOfTweetLabel.text = tweet.dateAgo;
    cell.tweetTextLabel.text = tweet.text;
    cell.likeNumberLabel.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    cell.retweetNumberLabel.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    cell.replyNumberLabel.text = @"15";
    
    [cell refreshData];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController = [segue destinationViewController];
    ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
    composeController.delegate = self;
}

@end
