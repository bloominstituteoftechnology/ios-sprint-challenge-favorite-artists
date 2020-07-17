//
//  TSBArtistDetailVC.h
//  Favorite Artists
//
//  Created by Thomas Sabino-Benowitz on 7/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSBArtistDetailVC : UIViewController

@property (atomic) NSMutableArray *_Nullable artists;
@property (nonatomic) TSBArtist *artist;


@end

NS_ASSUME_NONNULL_END
