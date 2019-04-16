#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>
#import <CollaborateSpace/CollaborateSpace.h>
#import "LoginViewController.h"

// <VCIntegrationDelegate>

@interface VCIntegration : CDVPlugin  {
    LoginViewController* _launchScreenViewController;
    NSString* _storyboardName;
    float _launchScreenStartAlpha;

}

- (void) show:(CDVInvokedUrlCommand*) command;

@end
