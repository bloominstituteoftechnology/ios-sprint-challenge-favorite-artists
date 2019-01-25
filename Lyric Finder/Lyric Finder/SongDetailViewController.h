//
//  SongDetailViewController.h
//  Lyric Finder
//
//  Created by Sean Hendrix on 1/25/19.
//  Copyright © 2019 Sean Hendrix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongController;
@class Song;
NS_ASSUME_NONNULL_BEGIN

@interface SongDetailViewController : UIViewController


@property SongController *songController;
@property Song *song;
-(void) updateViews;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

- (IBAction)stepper:(UIStepper *)sender;

@property (weak, nonatomic) IBOutlet UITextField *songTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

- (IBAction)searchForLyrics:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *songLyricsTextView;

- (IBAction)saveSong:(id)sender;



@end

NS_ASSUME_NONNULL_END
