//
//  ABCLyricsDetailViewController.h
//  LyricFinder
//
//  Created by Austin Cole on 3/1/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCLyricsSearchViewController : UIViewController

//MARK: IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingIncrementerSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextField *trackTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

//MARK: IBActions
- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)ratingIncrememnterSegmentedControlTapped:(id)sender;
- (IBAction)searchForLyricsButtonTapped:(id)sender;





@end

NS_ASSUME_NONNULL_END
