#import "VCIntegration.h"
#import "ViewController.h"

@implementation VCIntegration

- (void) show:(CDVInvokedUrlCommand*) command
{


    //  NSString* options = [command argumentAtIndex:2 withDefault:@"" andClass:[NSString class]];
  //    NSString* serverName = @"";
  //    NSString* personalID = @"";

  //  NSLog(@"VC - VCIntegration");
    //  NSArray* options = [[NSArray alloc] init];

    //NSDictionary* options = [[NSDictionary alloc] init];

    //options = [[[command arguments] objectAtIndex:0] objectFromJSONString];

  //  NSDictionary* options =[NSDictionary dictionaryWithJsonString:[[command arguments] objectAtIndex:0]];

  //    if ([[command arguments] count] > 0) {

    //    serverName = [[command arguments] objectForKey:@"serverName"];
        //serverName = [[command arguments] objectAtIndex:0];
      //  NSString* userMail = [[command arguments] objectAtIndex:1];
      //  NSString* passWord = [[command arguments] objectAtIndex:2];
      //  personalID = [[command arguments] objectAtIndex:1];
      //  personalID = [[command arguments] objectForKey:@"personalID"];
        //options = [command objectAtIndex:0];
    //    requestIdStr = [options objectForKey:@"requestId"];
      //  methodname =[options objectForKey:@"callback"];

      //NSLog(@"VC - VCIntegration - serverName %@",serverName );
      //NSLog(@"VC - VCIntegration - personalID %@",personalID );
    //  }

     NSString* name = [[command arguments] objectAtIndex:0];
     NSString* serverName;
     NSString* personalID;

  //   NSString* name = [[command arguments] objectAtIndex:0];
  //   NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];
     NSArray *temp;

     NSDictionary* options = (NSDictionary *)[[command arguments] objectAtIndex:0];

  /*   NSArray *elements = [name componentsSeparatedByString:@","];
     for (int i=0; i<[elements count];i++) {

          if (i==0) {
            temp = [elements[0] componentsSeparatedByString:@" : "];
            serverName = temp[1];
          }
          if (i==1) {
            temp = [elements[1] componentsSeparatedByString:@" : "];
            personalID = temp[1];
          }

     }

     */
    //NSData *data = [name dataUsingEncoding:NSUTF8StringEncoding];

    //NSError *error;

    //NSPropertyListFormat plistFormat;

    //NSDictionary *temp = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&plistFormat error:&error];
    //NSArray *options = (NSArray *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //NSArray *options = (NSArray *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    // NSString* name1 = [command argumentAtIndex:0];
     //NSString* name1 = [[command arguments] objectAtIndex:1];
    // options = [[command arguments] objectAtIndex:0];
    // NSString* msg = [NSString stringWithFormat: @"Hello, %@ %@ %@", name, [options objectAtIndex:0], [options objectAtIndex:1]];
    // NSString* msg = [NSString stringWithFormat: @"Hello, %@ %@ %@", name, serverName, personalID];
     NSString* msg = [NSString stringWithFormat: @"Hello, %@ %@ %@", name, [options valueForKey:@"serverName"], [options valueForKey:@"personalID"]];

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

     [alert show];

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
      [self.viewController addChildViewController:_launchScreenViewController];

  //    [appDelegate.window.rootViewController presentViewController:_launchScreenViewController animated:NO completion: nil];


    //  [self.viewController.navigationController pushViewController: _launchScreenViewController animated: YES];
      _launchScreenViewController.view.frame = self.viewController.view.frame;
      [self.viewController.view addSubview:_launchScreenViewController.view];
      [_launchScreenViewController didMoveToParentViewController:self.viewController];

      [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];

}

@end
