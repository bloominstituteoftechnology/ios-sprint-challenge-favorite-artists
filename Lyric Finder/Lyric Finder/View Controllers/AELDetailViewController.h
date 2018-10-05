//
//  AELDetailViewController.h
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AELDetailViewController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)ratingControl:(id)sender;
- (IBAction)search:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *songTitleField;

@property (weak, nonatomic) IBOutlet UITextField *artistField;

@property (weak, nonatomic) IBOutlet UITextView *lyricTextView;

@end

NS_ASSUME_NONNULL_END
