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
    self.screennameLabel.text = [@"@" stringByAppendingString:self.user.screenName];
    self.descriptionLabel.text = self.user.descriptionString;
    self.locationLabel.text = self.user.locationString;
    self.joinedLabel.text = [@"Joined: " stringByAppendingString:self.user.joinedString];
    //self.linkLabel.text = self.user.linkString;
    if(self.user.linkString != (id)[NSNull null]){
        self.linkLabel.text = self.user.linkString;
    }
    else{
        self.linkLabel.text = @"";
    }
    self.followingLabel.text = [NSString stringWithFormat:@"%d", self.user.followingNumber];
    self.followersLabel.text = [NSString stringWithFormat:@"%d", self.user.followersNumber];
    //[self.profileImageView setImageWithURL:self.user.profileImage];
    //[self.bannerImageView setImageWithURL:self.user.bannerImage];
    if(self.user.profileImage != nil){
        [self.profileImageView setImageWithURL:self.user.profileImage];
    }
    if(self.user.bannerImage != nil){
        [self.bannerImageView setImageWithURL:self.user.bannerImage];
    }
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
