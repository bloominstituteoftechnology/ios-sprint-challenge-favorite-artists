//
//  LSIArtistDetailViewController.m
//  Favorite-Artists
//
//  Created by Percy Ngan on 1/24/20.
//  Copyright © 2020 Lamdba School. All rights reserved.
//

#import "LSIArtistDetailViewController.h"
#import "LSIArtist.h"
#import "LSIArtistController.h"

@interface LSIArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameToSearchBarConstraint;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation LSIArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {

	self = [super initWithCoder:coder];

	return self;
}

- (void)viewDidLoad {

	[super viewDidLoad];

	if (self.artist) {
		[self.searchBar setHidden:true];
		[self.nameToSearchBarConstraint setPriority:999];
		[self.nameToSearchBarConstraint setConstant:-60];
		[self.navigationItem setRightBarButtonItem:nil];
		[self setTitle:[self.artist name]];
	} else {
		[self.searchBar setDelegate:self];
	}

	[self updateViews];
}

- (void)updateViews {
	if (self.artist) {
		[self.nameLabel setText:[self.artist name]];
		[self.textView setText:[self.artist biography]];

		if ([self.artist year] > 0) {
			[self.yearLabel setText:[NSString stringWithFormat:@"Formed in %d", [self.artist year]]];
		} else {
			[self.yearLabel setText:nil];
		}
	} else {
		[self.nameLabel setText:nil];
		[self.yearLabel setText:nil];
		[self.textView setText:nil];
	}
}

- (IBAction)save:(UIBarButtonItem *)sender {
	if (self.artist) {
		[[self.controller artists] addObject:self.artist];
		[self.navigationController popViewControllerAnimated:true];
	}
}

#pragma mark - Search bar delegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

	[searchBar resignFirstResponder];
	[self.controller getArtistsFromSearchTerm:[searchBar text] completion:^(NSError *error, LSIArtist *artist) {
		if (error) {
			NSLog(@"Error: %@", error);
			return;
		}

		if (artist) {
			self.artist = artist;

			dispatch_async(dispatch_get_main_queue(), ^{
				[self updateViews];
			});
		}
	}];
}

@end
