//
//  ReviewsTableViewController.h
//  movieApp
//
//  Created by mai ahmed on 4/15/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReviewsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *authorlabel;

@property (weak, nonatomic) IBOutlet UITextView *contenttext;

@property NSString *movieid;
@property NSMutableArray *names;
@property NSMutableArray *review;
@end

NS_ASSUME_NONNULL_END
