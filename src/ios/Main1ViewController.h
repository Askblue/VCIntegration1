//
//  MainViewController.h
//  TestCollaborateIOS
//
//  Copyright © 2019 ClearOne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollaborateUtils.h"
#import "AskblueUtils.h"


@interface Main1ViewController : UIViewController <CollaborateCallsManagerCallback>

@property (weak, nonatomic) id<AskblueUtilsDelegate> delegate;

@end
