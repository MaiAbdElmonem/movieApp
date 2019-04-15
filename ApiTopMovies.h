//
//  ApiTopMovies.h
//  movieApp
//
//  Created by mai ahmed on 4/7/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ApiTopMovies : UICollectionViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *requestseg;
- (IBAction)ReqAction:(id)sender;

//@property (nonatomic, copy) NSArray *movies;
//@property NSString *strimage;

@end


