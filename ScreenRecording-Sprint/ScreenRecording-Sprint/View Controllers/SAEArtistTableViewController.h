//
//  SAEArtistTableViewController.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import <UIKit/UIKit.h>

@class SAEArtist;
@class SAEArtistController;

NS_ASSUME_NONNULL_BEGIN

@interface SAEArtistTableViewController : UITableViewController

@property (nonatomic) SAEArtist *artist;
@property (nonatomic) SAEArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
