//
//  LSIArtistsTableViewController.h
//  Favorite_Artistis
//
//  Created by Joe on 5/30/20.
//  Copyright © 2020 AlphaGradeINC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"
#import "LSISearchArtistsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistsTableViewController : UITableViewController <ArtistDelegate>

@property (nonatomic) LSIArtistController *lsiArtistController;

@property (nonatomic) NSFileManager *manager;

- (NSString *)fileSavePath;

@end

NS_ASSUME_NONNULL_END
