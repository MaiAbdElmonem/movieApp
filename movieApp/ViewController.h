//
//  ViewController.h
//  movieApp
//
//  Created by mai ahmed on 4/7/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HCSStarRatingView/HCSStarRatingView.h>
#import "ReviewsTableViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *Title;

@property (weak, nonatomic) IBOutlet UILabel *Vote;

@property (weak, nonatomic) IBOutlet UILabel *ReleaseDate;

@property (weak, nonatomic) IBOutlet UITextView *Overview;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starview;


@property (weak, nonatomic) NSString *ratingStr;



@property NSString *strTitle;
@property NSString *strVote;
@property NSString *strOverview;
@property NSString *strReleaseDate;
@property NSString *strimageurl;
@property NSString *strID;


@end

