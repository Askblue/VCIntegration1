//
//  CollaborateUtils.h
//  TestCollaborateIOS
//
//  Copyright © 2019 Askblue. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AskblueUtilsDelegate <NSObject>
- (void)viewDismiss;
@end

@interface AskblueUtils : NSObject

+(AskblueUtils*)Instance;

@property (nonatomic, retain) NSString *myServer;
@property (nonatomic, retain) NSString *myToken;

@end
