//
//  SAEDetialArtistViewController.h
//  ScreenRecording-Sprint
//
//  Created by Sammy Alvarado on 11/21/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SAEArtist;
@class SAEArtistController;

@interface SAEDetialArtistViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic) SAEArtist *artist;
@property (nonatomic) SAEArtistController *artistController;

@end

NS_ASSUME_NONNULL_END
