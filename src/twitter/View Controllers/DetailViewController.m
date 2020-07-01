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

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //set profile pic
    NSURL *profileImageURL = [NSURL URLWithString:self.tweet.user.profileImageURLString];
    [self.profileImageView setImageWithURL:profileImageURL];

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
