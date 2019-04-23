#import "VCIntegration.h"
#import "LoginViewController.h"
#import "AskblueUtils.h"
//#import "LoginViewController.h"

@implementation VCIntegration

- (void) show:(CDVInvokedUrlCommand*) command
{

     _localcmd = command;
  //   NSString* name = [[command arguments] objectAtIndex:0];
     NSString* serverName;
     NSString* personalID;

  //   NSString* name = [[command arguments] objectAtIndex:0];
  //   NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];
  //   NSArray *temp;

     NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];


     NSString* msg = [NSString stringWithFormat: @"serverName: %@ personalID: %@", [options valueForKey:@"serverName"], [options valueForKey:@"personalID"]];

     serverName = [NSString stringWithFormat: @"%@",[options valueForKey:@"serverName"]];

     personalID = [NSString stringWithFormat: @"%@",[options valueForKey:@"personalID"]];

     NSString* msg1 = [NSString stringWithFormat: @"serverName: %@ personalID: %@", serverName, personalID];

     AskblueUtils *instance = [AskblueUtils Instance];

     instance.myServer = serverName;
     instance.myToken = personalID;

    //  NSString* serverName = [[command arguments] objectAtIndex:0];
    //  NSString* userMail = [[command arguments] objectAtIndex:1];
    //  NSString* passWord = [[command arguments] objectAtIndex:2];
    //  NSString* personalID = [[command arguments] objectAtIndex:1];
      //NSString* personalID = [options objectAtIndex:1];
    //  NSString* personalID = [arguments objectAtIndex:1];

//      NSLog(@"VC - VCIntegration1 %@", serverName);
    //  NSLog(@"VC - VCIntegration2 %@", userMail);
      //NSLog(@"VC - VCIntegration3 %@", passWord);
    //  NSLog(@"VC - VCIntegration4 %@", personalID);


      CDVPluginResult* result = [CDVPluginResult
                                 resultWithStatus:CDVCommandStatus_OK
                                 messageAsString:msg];

     UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"nope"
                                       message:msg1
                                      delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];

    // [alert show];

     _storyboardName = @"Main1";

     UIStoryboard* sb = [UIStoryboard storyboardWithName:_storyboardName bundle:nil];


  //   _launchScreenViewController = [sb instantiateInitialViewController];

      //self.sb = [UIStoryboard storyboardWithName:_storyboardName bundle:nil];

    //  UIViewController *_launchScreenViewController = [[UIStoryboard storyboardWithName:_storyboardName bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController1"];

    //  ViewController *_launchScreenViewController = [[UIStoryboard storyboardWithName:_storyboardName bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController1"];

     _launchScreenViewController = [sb instantiateInitialViewController];

//      _launchScreenViewController = [[LoginViewController alloc] init];
      _launchScreenStartAlpha = _launchScreenViewController.view.alpha;



      //  _launchScreenViewController.serverName = serverName;
      //  _launchScreenViewController.personalID = personalID;
      //  _launchScreenViewController.delegate = self;

  //    _launchScreenViewController.serverName = serverName;
  //    _launchScreenViewController.personalID = personalID;

      _launchScreenViewController.view.alpha = _launchScreenStartAlpha;

    //  _launchScreenViewController.serverName = serverName;
    //  _launchScreenViewController.personalID = personalID;

      [self.viewController addChildViewController:_launchScreenViewController];

   //    [self presentViewController:_launchScreenViewController animated:YES completion:nil];

      // [self.window.rootViewController presentViewController:_launchScreenViewController animated:NO completion: nil];


  //    [self.viewController.navigationController pushViewController: _launchScreenViewController animated: YES];



      _launchScreenViewController.view.frame = self.viewController.view.frame;
      [self.viewController.view addSubview:_launchScreenViewController.view];
      [_launchScreenViewController didMoveToParentViewController:self.viewController];

      _launchScreenViewController.delegate = self;

      //[self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}


- (void)result:(NSString *)code andMessage:(NSString *)message {

    if (code != nil) {
      //  CDVPluginResult* result1 = [CDVPluginResult
      //                             resultWithStatus:CDVCommandStatus_ERROR
      //                             messageAsString:message];

      //  [self.commandDelegate sendPluginResult:result1 callbackId:_localcmd.callbackId];

      CDVPluginResult* result1 = [CDVPluginResult
                                 resultWithStatus:CDVCommandStatus_OK
                                 messageAsString:message];

      [self.commandDelegate sendPluginResult:result1 callbackId:_localcmd.callbackId];
      
    } else {
        CDVPluginResult* result2 = [CDVPluginResult
                                   resultWithStatus:CDVCommandStatus_OK
                                   messageAsString:message];

        [self.commandDelegate sendPluginResult:result2 callbackId:_localcmd.callbackId];
    }

}


/*
-(NSString *) onGetPersonalID {

    return serverName;
}
-(NSString *) onGetServerName {

    return personalID;

}
*/

@end
