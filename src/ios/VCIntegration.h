#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>
#import <CollaborateSpace/CollaborateSpace.h>
#import "LoginViewController.h"
#import "AskblueUtils.h"

// <VCIntegrationDelegate>

@interface VCIntegration : CDVPlugin <AskblueUtilsDelegate> {
    LoginViewController* _launchScreenViewController;
    NSString* _storyboardName;
    CDVInvokedUrlCommand* _localcmd;
    float _launchScreenStartAlpha;

}

- (void) show:(CDVInvokedUrlCommand*) command;

@end
