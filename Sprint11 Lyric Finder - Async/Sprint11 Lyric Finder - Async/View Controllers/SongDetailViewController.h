//
//  SongDetailViewController.h
//  

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SongDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *songRatingLabel;

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;

@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;


@end

NS_ASSUME_NONNULL_END
