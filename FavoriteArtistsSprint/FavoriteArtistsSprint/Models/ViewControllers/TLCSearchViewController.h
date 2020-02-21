//
//  TLCSearchViewController.h
//  FavoriteArtistsSprint
//
//  Created by Lambda_School_Loaner_219 on 2/21/20.
//  Copyright © 2020 Lambda_School_Loaner_219. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TLCArtistController, TLCArtist;



@interface TLCSearchViewController : UIViewController <UISearchBarDelegate>
@property (nonatomic) TLCArtistController *artistController;
@property (nonatomic) TLCArtist *artist;

@end


