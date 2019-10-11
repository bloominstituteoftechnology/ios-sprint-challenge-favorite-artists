//
//  ViewController.m
//  Favorite Artists ObjC
//
//  Created by Michael Redig on 10/11/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "REPArtistDetailViewController.h"
#import "REPArtist+CoreDataClass.h"
#import "REPArtistNetController.h"
#import "REPCoreDataStack.h"

@interface REPArtistDetailViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;

//@property REPArtist *searchArtist;
@property REPArtistNetController *netController;

@end

@implementation REPArtistDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		[self commonInit];
	}
	return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	_netController = [[REPArtistNetController alloc] init];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	[self updateViews];
}

- (void)updateViews {
	[self resetViews];

	__block NSString *name = @"";
	__block NSString *yearFormed = @"";
	__block NSString *bio = @"";

	if (self.artist) {
		name = self.artist.name;
		yearFormed = [NSString stringWithFormat:@"Formed in %i", self.artist.yearFormed];
		bio = self.artist.bio;
		self.navigationItem.title = name;
		[self.searchBar setHidden:YES];
	}

	if (self.netController.lastSearchResult) {
		[self.netController.lastSearchResult.managedObjectContext performBlockAndWait:^{
			name = self.netController.lastSearchResult.name;
			yearFormed = [NSString stringWithFormat:@"Formed in %i", self.netController.lastSearchResult.yearFormed];
			bio = self.netController.lastSearchResult.bio;
		}];
		[self.saveButton setEnabled:YES];
	}

	self.titleLabel.text = name;
	self.subtitleLabel.text = yearFormed;
	self.infoTextView.text = bio;
}

- (void)resetViews {
	[self.searchBar setHidden:NO];

	self.navigationItem.title = @"Search For New Artist";
	[self.saveButton setEnabled:NO];

	self.titleLabel.text = @"";
	self.subtitleLabel.text = @"";
	self.infoTextView.text = @"";
}


- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
	if (self.netController.lastSearchResult) {
		NSError *error;
		[[REPCoreDataStack sharedInstance] saveContext:self.netController.lastSearchResult.managedObjectContext error:error];
		if (error) {
			NSLog(@"Error saving artist to context: %@", error);
			return;
		}
		[self.navigationController popViewControllerAnimated:YES];
	}
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	NSLog(@"search for %@", searchBar.text);
	[searchBar resignFirstResponder];

	[self.netController fetchArtistNamed:searchBar.text completionBlock:^(REPArtist *artist, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^(void){
//			self.searchArtist = self.netController.lastSearchResult;
			[self updateViews];
		});
	}];
}


@end
