//
//  IGFAddArtistViewController.h
//  IGFArtist
//
//  Created by Ian French on 9/27/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class IGFArtistController, IGFArtist;


@interface IGFAddArtistViewController : UIViewController <UISearchBarDelegate>


@property (nonatomic) IGFArtist *artist;
@property (nonatomic) IGFArtistController *artistController;



@end

NS_ASSUME_NONNULL_END
