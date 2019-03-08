//
//  SongDetailViewController.m
//  

#import "SongDetailViewController.h"

@interface SongDetailViewController ()

- (IBAction)stepperChanged:(id)sender;
- (IBAction)searchButton:(id)sender;
- (IBAction)save:(id)sender;

@end

@implementation SongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)stepperChanged:(id)sender {
    
    self.songRatingLabel.text = [NSString stringWithFormat:@"Rating: %d", [[NSNumber numberWithDouble: [(UIStepper *)sender value]] intValue]];
}

- (IBAction)searchButton:(id)sender {
}

- (IBAction)save:(id)sender {
}
@end
