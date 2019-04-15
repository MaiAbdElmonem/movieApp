//
//  ViewController.m
//  movieApp
//
//  Created by mai ahmed on 4/7/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <HCSStarRatingView/HCSStarRatingView.h>

@interface ViewController ()
@property NSNumber* mid;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"add"  style:UIBarButtonItemStylePlain target:self action:@selector(addAction)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
}




- (void)viewWillAppear:(BOOL)animated{
    NSString *IMAGE_BASE_URL = @"https://image.tmdb.org/t/p/w185%@";
    [_image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:IMAGE_BASE_URL,_strimageurl]]];
    [_Title setText:_strTitle];
    [_Vote setText:[NSString stringWithFormat:@"%@",_strVote]];
    [_Overview setText:_strOverview];
    [_ReleaseDate setText:_strReleaseDate];


    self.starview.maximumValue = 5;
    self.starview.minimumValue = 0;
    self.starview.value = 0;
    self.starview.tintColor = [UIColor redColor];
    self.starview.allowsHalfStars = YES;
    self.starview.emptyStarImage = [[UIImage imageNamed:@"heart-empty"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.starview.filledStarImage = [[UIImage imageNamed:@"heart-full"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.starview addTarget:self action:@selector(didChangeValue:) forControlEvents:UIControlEventValueChanged];

    
}

-(void)addAction{
    
    
}

- (IBAction)showreview:(id)sender {
    ReviewsTableViewController *UVC=[self.storyboard instantiateViewControllerWithIdentifier:@"rev"];
    
    [UVC setMovieid:_strID];
    [UVC setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController pushViewController:UVC animated:YES];
//[self. pushViewController:UVC animnavigationControllerated:YES ];
    
}






@end
