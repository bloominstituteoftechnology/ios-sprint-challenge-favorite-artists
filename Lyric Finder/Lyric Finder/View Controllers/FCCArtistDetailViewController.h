//
//  FCCArtistDetailViewController.h
//  Lyric Finder
//
//  Created by Lambda_School_Loaner_34 on 4/5/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FCCArtistController;
@class FCCArtist;

NS_ASSUME_NONNULL_BEGIN

@interface FCCArtistDetailViewController : UIViewController

@property (nonatomic) FCCArtistController *artistController;
@property (nonatomic) FCCArtist * artist;

@end

NS_ASSUME_NONNULL_END
