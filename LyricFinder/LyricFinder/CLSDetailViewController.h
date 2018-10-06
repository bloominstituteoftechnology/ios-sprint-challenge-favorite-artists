//
//  CLSDetailViewController.h
//  LyricFinder
//
//  Created by Carolyn Lea on 10/5/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import "CLSSongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CLSDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ratingsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepperView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property Song *song;
@property CLSSongController *songController;

@end

NS_ASSUME_NONNULL_END
