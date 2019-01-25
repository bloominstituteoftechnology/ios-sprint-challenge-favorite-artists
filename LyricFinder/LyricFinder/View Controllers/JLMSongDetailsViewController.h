//
//  JLMSongDetailsViewController.h
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLMSongController;
@class JLMSong;

NS_ASSUME_NONNULL_BEGIN

@interface JLMSongDetailsViewController : UIViewController

@property JLMSongController *songController;
@property JLMSong *song;

-(void) updateViews;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *songLyricsTextView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

- (IBAction)stepper:(UIStepper *)sender;
- (IBAction)searchForLyrics:(id)sender;
- (IBAction)saveSong:(id)sender;

@end

NS_ASSUME_NONNULL_END
