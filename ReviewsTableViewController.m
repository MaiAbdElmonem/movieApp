//
//  ReviewsTableViewController.m
//  movieApp
//
//  Created by mai ahmed on 4/15/19.
//  Copyright © 2019 mai ahmed. All rights reserved.
//

#import "ReviewsTableViewController.h"
#import "AFNetworking.h"

@interface ReviewsTableViewController(){
    NSArray *moviereview;
    UILabel *author;
    UITextView *content;
}


@end

@implementation ReviewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _names =[NSMutableArray new];
    _review = [NSMutableArray new];
    
    NSString *apiURL = [NSString stringWithFormat:@"%@/%@/%@", @"https://api.themoviedb.org/3/movie", _movieid, @"reviews?api_key=a832062a90ac3b978412bf48f92509a6&language=en-US"];
    NSURLSessionConfiguration *configurationz = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *managerz = [[AFURLSessionManager alloc] initWithSessionConfiguration:configurationz];
    NSURL *URL = [NSURL URLWithString:apiURL ];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [managerz dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
                                      {
                                          
                                          if (error)
                                          {
                                              NSLog(@"Errorzzzzzzzzzzzzzzzzzzzzzzzz: %@", error);
                                              
                                          }
                                          else
                                          {
                                              NSLog(@"start of else \n");
                                              NSLog(@"%@",self->_movieid);
                                              NSLog(@"%@",apiURL);
                                              
                                              NSDictionary *sf;
                                              NSArray* latest = [responseObject objectForKey:@"results"];
                                              for(int i = 0 ; i < latest.count ; i++)
                                              {
                                                  sf = latest[i];
                                                  self->_names[i] = [sf objectForKey:@"author"];
                                                  self->_review[i] = [sf objectForKey:@"content"];
                                                  
                                                  
                                              }
                                              [self.tableView reloadData];
                                          }
                                          
                                      }];
    [dataTask resume];
     }

#pragma mark - Table view data source
     
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _names.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSLog(@"start of cell view");
    UILabel *nameLabel = [cell viewWithTag:1];
    UITextView *reviewText = [cell viewWithTag:2];
    [nameLabel setText:_names[indexPath.row]];
    [reviewText setText:_review[indexPath.row]];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
