//
//  OSISongDetailViewController.h
//  Sprint11
//
//  Created by Sergey Osipyan on 3/1/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSISong.h"
#import "OSISongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSISongDetailViewController : UIViewController
@property OSISong *song;
@property OSISongController *osiSongController;
@end

NS_ASSUME_NONNULL_END
