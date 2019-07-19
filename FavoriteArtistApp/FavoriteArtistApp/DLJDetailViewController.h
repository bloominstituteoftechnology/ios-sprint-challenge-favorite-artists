//
//  DLJDetailViewController.h
//  FavoriteArtistApp
//
//  Created by Diante Lewis-Jolley on 7/19/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLJDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *formedLabel;

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@interface DLJDetailViewController (UITextViewDelegate) <UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
