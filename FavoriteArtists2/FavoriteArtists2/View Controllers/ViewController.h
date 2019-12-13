//
//  ViewController.h
//  FavoriteArtists2
//
//  Created by Jesse Ruiz on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLRFavoriteArtist2Controller.h"
#import "Artist+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) JLRFavoriteArtist2Controller *artistController;
@property (nonatomic, strong) Artist *artist;

@property (weak, nonatomic) IBOutlet UILabel *artistTitle;
@property (weak, nonatomic) IBOutlet UILabel *artistDateFormed;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@interface ViewController (UITextViewDelegate) <UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
