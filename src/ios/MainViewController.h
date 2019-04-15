//
//  MainViewController.h
//  TestCollaborateIOS
//
//  Copyright © 2019 ClearOne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollaborateUtils.h"

@interface MainViewController : UIViewController <CollaborateCallsManagerCallback>

@property (nonatomic, retain) NSString* _storyboardName;

@end
