#import "VCIntegration.h"
#import "ViewController.h"

@implementation VCIntegration

- (void) show:(CDVInvokedUrlCommand*) command
{


  //   NSString* name = [[command arguments] objectAtIndex:0];
     NSString* serverName;
     NSString* personalID;

  //   NSString* name = [[command arguments] objectAtIndex:0];
  //   NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];
  //   NSArray *temp;

     NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];


     NSString* msg = [NSString stringWithFormat: @"serverName: %@ personalID: %@", [options valueForKey:@"serverName"], [options valueForKey:@"personalID"]];

     serverName = [options valueForKey:@"serverName"];
     personalID = [options valueForKey:@"personalID"];

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
                                       message:msg
                                      delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];

    // [alert show];

     _storyboardName = @"Main1";

     UIStoryboard* sb = [UIStoryboard storyboardWithName:_storyboardName bundle:nil];


  //   _launchScreenViewController = [sb instantiateInitialViewController];



    //  self.sb = [UIStoryboard storyboardWithName:_storyboardName bundle:nil];
  //   _launchScreenViewController = [sb instantiateInitialViewController];

     _launchScreenViewController = [[ViewController alloc] init];
     _launchScreenStartAlpha = _launchScreenViewController.view.alpha;

      //_launchScreenViewController.serverName = serverName;
      //_launchScreenViewController.personalID = personalID;

      _launchScreenViewController.view.alpha = _launchScreenStartAlpha;
      _launchScreenViewController.serverName = serverName;
      _launchScreenViewController.personalID = personalID;
      [self.viewController addChildViewController:_launchScreenViewController];

  //    [appDelegate.window.rootViewController presentViewController:_launchScreenViewController animated:NO completion: nil];


    //  [self.viewController.navigationController pushViewController: _launchScreenViewController animated: YES];
      _launchScreenViewController.view.frame = self.viewController.view.frame;
      [self.viewController.view addSubview:_launchScreenViewController.view];
      [_launchScreenViewController didMoveToParentViewController:self.viewController];

      [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

@end
