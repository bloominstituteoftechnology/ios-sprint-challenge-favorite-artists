//
//  SongDetailViewController.m
//  

#import "SongDetailViewController.h"

@interface SongDetailViewController ()

    @property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
    
    @property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
    
    @property (weak, nonatomic) IBOutlet UITextField *artistTextField;
    
    @property (weak, nonatomic) IBOutlet UIButton *searchButton;
    
    @property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
    
- (IBAction)searchForLyrics:(id)sender;
    
- (IBAction)save:(id)sender;
    
- (IBAction)stepperChanged:(id)sender;
    
    
@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)searchForLyrics:(id)sender {
}
    
- (IBAction)save:(id)sender {
}
    
- (IBAction)stepperChanged:(id)sender {
    self.ratingLabel.text = [NSString stringWithFormat:@"Rating: %d", [[NSNumber numberWithDouble: [(UIStepper *)sender value]] intValue]];
    
    
}
    @end
