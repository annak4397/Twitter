//
//  TweetCell.m
//  twitter
//
//  Created by Anna Kuznetsova on 6/29/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
#import "UIImageView+AFNetworking.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *profileTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapUserProfile:)];
    [self.profileImageView addGestureRecognizer:profileTapGestureRecognizer];
    [self.profileImageView setUserInteractionEnabled:YES];
}
- (IBAction)didTapFavorite:(id)sender {
    // TODO: Update the local tweet model
    // TODO: Update cell UI
    // TODO: Send a POST request to the POST favorites/create endpoint
    if(self.tweet.favorited){
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData];
        
        [[APIManager shared] unFavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error un-favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully un-favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self refreshData];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}
- (IBAction)didTapRetweet:(id)sender {
    if(self.tweet.retweeted){
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData];
        
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error un-retweet tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully un-retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self refreshData];
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                 NSLog(@"Error retweet tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
            }
        }];
    }
}
-(void)refreshData{
    //profileImageView;
    //nameOfUserLabel;
    //usernameLabel;
    //dateOfTweetLabel;
   // tweetTextLabel;
    //replyButton;
    //replyNumberLabel;
    //retweetButton;
    if(self.tweet.retweeted){
        
        self.retweetButton.selected = YES;
    }
    else{
        self.retweetButton.selected = NO;
        //[self.likeButton setImage: [UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    self.retweetNumberLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    
    //likeButton;
    if(self.tweet.favorited){
        
        self.likeButton.selected = YES;
        
        //[self.likeButton setImage: [UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateSelected];
    }
    else{
        self.likeButton.selected = NO;
        //[self.likeButton setImage: [UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
    self.likeNumberLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    //messageButton;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setCellTweet:(Tweet *)tweetPassed{
    //set profile pic
    NSURL *profileImageURL = tweetPassed.user.profileImage;
    [self.profileImageView setImageWithURL:profileImageURL];
    
    self.nameOfUserLabel.text = tweetPassed.user.name;
    NSString *atSymb = @"@";
    self.usernameLabel.text = [atSymb stringByAppendingFormat:tweetPassed.user.screenName];
    self.dateOfTweetLabel.text = tweetPassed.dateAgo;
    self.tweetTextLabel.text = tweetPassed.text;
    //self.likeButton.titleLabel.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    //self.retweetButton.titleLabel.text = [NSString stringWithFormat:@"%d",tweet.retweetCount];
    //self.replyButton.titleLabel.text = @"0";
    self.likeNumberLabel.text = [NSString stringWithFormat:@"%d",tweetPassed.favoriteCount];
    self.retweetNumberLabel.text = [NSString stringWithFormat:@"%d",tweetPassed.retweetCount];
    self.replyNumberLabel.text = @"15";
}
- (void) didTapUserProfile:(UITapGestureRecognizer *)sender{
    // TODO: Call method on delegate
    [self.delegate tweetCell:self didTap:self.tweet.user];
}

@end
