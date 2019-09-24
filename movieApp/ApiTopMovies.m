//
//  ApiTopMovies.m
//  movieApp
//
//  Created by mai ahmed on 4/7/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import "ApiTopMovies.h"
#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFNetworking.h"

@interface ApiTopMovies () {
    

NSArray *moviedata;
UIImageView *imageView;
}

@end

@implementation ApiTopMovies
 @synthesize requestseg;
static NSString * const reuseIdentifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
self.collectionView.backgroundColor = [UIColor blackColor];
    moviedata =[NSMutableArray new];
    [self connectApi:@"https://api.themoviedb.org/3/movie/popular?api_key=658680e409a5e9e11988f3e49361edae&language=en-//US&page=1&fbclid=IwAR2j1C9v0j1f2-mB4w-w8YY5Ff70Md3qap98cflmyfrnBoSHWDega0WdedA"];
}
-(void)connectApi :(NSString*) req{
        
    NSURL *URL = [NSURL URLWithString:req];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:URL.absoluteString parameters:nil progress:nil   success:^(NSURLSessionTask *task, id responseObject) {
        moviedata  = [responseObject objectForKey:@"results"];
        

            [self.collectionView reloadData];
        

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    }
    





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return [moviedata count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    NSString *urlAsStringImg = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w185%@",  moviedata [indexPath.row][@"poster_path"]];
    imageView = [cell viewWithTag:1];
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlAsStringImg]
                 placeholderImage:[UIImage imageNamed:@"apple.png"]];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    ViewController *vc= [self.storyboard instantiateViewControllerWithIdentifier:@"VC"];

    
    vc.strimageurl=[moviedata objectAtIndex:indexPath.row][@"poster_path"];
    vc.strTitle=[moviedata objectAtIndex:indexPath.row][@"title"];
  vc.strVote=[moviedata objectAtIndex:indexPath.row][@"vote_average"];
    vc.strOverview=[moviedata objectAtIndex:indexPath.row][@"overview"];
   vc.strReleaseDate=[moviedata objectAtIndex:indexPath.row][@"release_date"];
    vc.strID=[moviedata objectAtIndex:indexPath.row][@"id"];
    

    [vc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController pushViewController:vc animated:YES];
   // [self.pushViewController:vc animnavigationControllerated:YES ];
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (void)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
}
*/


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

//- (IBAction)requestAction:(id)sender {
//    if(request.selectedSegmentIndex==0){
//        self.collectionView.backgroundColor = [UIColor blackColor];
//        moviedata =[NSMutableArray new];
//
//        //NSURL *URL = [NSURL URLWithString:];
//
//            //  NSString *jkhgksjdfkg =
//            [self.collectionView reloadData];
//            [self connectApi:@"https://api.themoviedb.org/3/movie/popular?api_key=658680e409a5e9e11988f3e49361edae&language=en-//US&page=1&fbclid=IwAR2j1C9v0j1f2-mB4w-w8YY5Ff70Md3qap98cflmyfrnBoSHWDega0WdedA"];
//    }
//    else{
//            [self.collectionView reloadData];
//            [self connectApi:@"https://api.themoviedb.org/3/movie/top_rated?api_key=658680e409a5e9e11988f3e49361edae&language=en-//US&page=1&fbclid=IwAR2j1C9v0j1f2-mB4w-w8YY5Ff70Md3qap98cflmyfrnBoSHWDega0WdedA"];
//    }
//}
//


- (IBAction)ReqAction:(id)sender {
    if(requestseg.selectedSegmentIndex==0){
              self.collectionView.backgroundColor = [UIColor blackColor];
               moviedata =[NSMutableArray new];
       
//              NSURL *URL = [NSURL URLWithString:];
        
//                  NSString *well =
                    [self.collectionView reloadData];
                  [self connectApi:@"https://api.themoviedb.org/3/movie/popular?api_key=658680e409a5e9e11988f3e49361edae&language=en-//US&page=1&fbclid=IwAR2j1C9v0j1f2-mB4w-w8YY5Ff70Md3qap98cflmyfrnBoSHWDega0WdedA"];
          }
           else{
                   [self.collectionView reloadData];
                    [self connectApi:@"https://api.themoviedb.org/3/movie/top_rated?api_key=658680e409a5e9e11988f3e49361edae&language=en-//US&page=1&fbclid=IwAR2j1C9v0j1f2-mB4w-w8YY5Ff70Md3qap98cflmyfrnBoSHWDega0WdedA"];
            }
        }
        

@end
    
