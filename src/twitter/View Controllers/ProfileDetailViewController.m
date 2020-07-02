//
//  ProfileDetailViewController.m
//  twitter
//
//  Created by Anna Kuznetsova on 7/1/20.
//  Copyright © 2020 Emerson Malca. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screennameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *joinedLabel;
@property (weak, nonatomic) IBOutlet UILabel *linkLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;

@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameLabel.text = self.user.name;
    self.screennameLabel.text = self.user.screenName;
    self.descriptionLabel.text = self.user.descriptionString;
    self.locationLabel.text = self.user.locationString;
    self.joinedLabel.text = self.user.joinedString;
    self.linkLabel.text = self.user.linkString;
    self.followingLabel.text = [NSString stringWithFormat:@"%d", self.user.followingNumber];
    self.followersLabel.text = [NSString stringWithFormat:@"%d", self.user.followersNumber];
    NSURL *profileImageURL = [NSURL URLWithString:self.user.profileImageURLString];
    [self.profileImageView setImageWithURL:profileImageURL];
    [self.bannerImageView setImageWithURL:self.user.bannerImage];
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
