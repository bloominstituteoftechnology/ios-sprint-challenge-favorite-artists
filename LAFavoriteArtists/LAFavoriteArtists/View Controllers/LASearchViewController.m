//
//  LASearchViewController.m
//  LAFavoriteArtists
//
//  Created by Angel Buenrostro on 4/5/19.
//  Copyright © 2019 Angel Buenrostro. All rights reserved.
//

#import "LASearchViewController.h"
#import "LAArtist.h"
#import "LAArtistController.h"
#import "LAArtistFetcher.h"

@interface LASearchViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;


@end

@implementation LASearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.searchBar setDelegate:self];
    
    
}
- (IBAction)saveButtonPressed:(id)sender {
    // IMPLEMENT SAVE USING NSFILEMANAGER
    
    // POP VIEW CONTROLLER
    [self.navigationController popViewControllerAnimated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)updateViews{
    
}

//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    LAArtistController *artistController = [[LAArtistController alloc]init];
//    if (searchText.length == 0){
//        [artistController]
//    }
//
//}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    LAArtistFetcher *fetcher = [[LAArtistFetcher alloc]init];
    
    
    [fetcher fetchArtist:searchBar.text completionBlock:^(LAArtist * artist, NSError * error) {
        if (error){
            NSLog(@"@error:", error);
            return;
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Do UI stuff here
                [self.navigationItem setTitle:artist.name];
                [self->_biographyTextView setText:artist.biography];
            });
        }
    }];
}

@end
