//
//  SongDetailViewController.h
//  

#import <UIKit/UIKit.h>
#import "ALWSongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SongDetailViewController : UIViewController

@property ALWSongController *songController;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;

@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

@end

NS_ASSUME_NONNULL_END
