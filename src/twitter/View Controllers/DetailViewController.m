//
//  DetailViewController.m
//  twitter
//
//  Created by Anna Kuznetsova on 6/30/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "DetailViewController.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeAndDateLabel;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set profile pic
    NSURL *profileImageURL = [NSURL URLWithString:self.tweet.user.profileImageURLString];
    [self.profileImageView setImageWithURL:profileImageURL];
    self.nameLabel.text = self.tweet.user.name;
    NSString *at = @"@";
    self.screenNameLabel.text = [at stringByAppendingFormat:self.tweet.user.screenName];
    self.tweetTextLabel.text = self.tweet.text;
    self.timeAndDateLabel.text = self.tweet.createdAtOriginalString;

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
