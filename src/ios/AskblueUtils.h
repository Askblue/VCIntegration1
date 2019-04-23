//
//  CollaborateUtils.h
//  TestCollaborateIOS
//
//  Copyright © 2019 Askblue. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AskblueUtilsDelegate <NSObject>
@optional
- (void)viewDismiss;
- (void)result:(NSString *)code andMessage:(NSString *)message;
@end

@protocol AskblueUtilsDelegate1 <NSObject>
- (void)viewDismiss;
@end

@interface AskblueUtils : NSObject

+(AskblueUtils*)Instance;

@property (nonatomic, retain) NSString *myServer;
@property (nonatomic, retain) NSString *myToken;

@end
