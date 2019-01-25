//
//  JLMSongTableViewCell.h
//  LyricFinder
//
//  Created by Jason Modisett on 1/25/19.
//  Copyright © 2019 Jason Modisett. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLMSongTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@end

NS_ASSUME_NONNULL_END
