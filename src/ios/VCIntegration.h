#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>
#import <CollaborateSpace/CollaborateSpace.h>
#import "ViewController.h"

// <VCIntegrationDelegate>

@interface VCIntegration : CDVPlugin <VCIntegrationDelegate> {
    ViewController* _launchScreenViewController;
    NSString* _storyboardName;
    float _launchScreenStartAlpha;

}

@property (nonatomic, retain) NSString* serverName;
@property (nonatomic, retain) NSString* personalID;

- (void) show:(CDVInvokedUrlCommand*) command;
- (NSString *) onGetPersonalID;
- (NSString *) onGetServerName;



@end
