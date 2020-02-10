//
//  VVSAddSearchViewController.h
//  Favorite Artists
//
//  Created by Vici Shaweddy on 2/9/20.
//  Copyright © 2020 Vici Shaweddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVSArtistController.h"
#import "VVSArtist.h"

@protocol SearchDetailDelegate <NSObject>

- (void)didSave:(VVSArtist *)artist;

@end

@interface VVSAddSearchViewController : UIViewController <UISearchBarDelegate>

typedef NS_ENUM(NSInteger, ViewType) {
    Search,
    Detail
};

- (void)updateViews;

@property(nonatomic, weak) id <SearchDetailDelegate> delegate;
@property (nonatomic) VVSArtistController *artistController;
@property (nonatomic) VVSArtist *artist;
@property (nonatomic) ViewType viewType;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *bioTextView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
