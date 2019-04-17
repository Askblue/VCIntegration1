//
//  LoginViewController.m
//  TestCollaborateIOS
//
//  Copyright © 2018 ClearOne. All rights reserved.
//

#import "LoginViewController.h"
#import "AskblueUtils.h"
#import "CollaborateUtils.h"

@interface LoginViewController ()

@property (nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CollaborateUtils *instance = [CollaborateUtils Instance];
    CollaborateUtils.Instance.loginCallback = self;

    [self onMeetingTokenGo:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onLoginResult:(BOOL)loginOK error:(eSptConnectionResult)error{
    _activityIndicator.hidden = YES;

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"test2"
                                      message:@"87052327"
                                     delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    NSLog(@"VC - onGetTokenDataResult");
    [alert show];

    if ( loginOK ){
        [self performSegueWithIdentifier:@"showMain" sender:self];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error connecting" message:@"Unable to login to the service" preferredStyle:UIAlertControllerStyleAlert ];
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)onMeetingTokenGo:(id)sender {

    _activityIndicator.hidden = NO;

    AskblueUtils *instanceAB = [AskblueUtils Instance];

    NSString *server = @"collaboratespace.net";
    NSString *token = @"67243416";

  //  server = [NSString stringWithFormat:@"%@", [instanceAB myServer]];
//    token = [NSString stringWithFormat:@"%@",  [instanceAB myToken]];
    [CollaborateUtils.Instance.api getTokenData:[NSString stringWithFormat:@"%@", [instanceAB myToken]]
                                         server:[NSString stringWithFormat:@"%@", [instanceAB myServer]]];
    [CollaborateUtils.Instance.api getTokenData:token server:server];

}

-(void)onGetTokenDataResult:(SptTokenDataResult *)tokenDataResult{
    NSString *error = nil;

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"test1"
                                      message:@"87052327"
                                     delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    NSLog(@"VC - onGetTokenDataResult");
    [alert show];

    switch ( tokenDataResult.result ){
        case kSptTokenDataResultJoinMeeting:
            //It is a token to join meeting
            CollaborateUtils.Instance.loginMeetingSeqID = tokenDataResult.meetingSequenceID;
            [CollaborateUtils.Instance.api loginWithTokenDataResult:tokenDataResult];
            break;
        case kSptTokenDataResultLogin:
            //It is a token to login
            [CollaborateUtils.Instance.api loginWithTokenDataResult:tokenDataResult];
            CollaborateUtils.Instance.loginMeetingSeqID = tokenDataResult.meetingSequenceID;
            break;
        case kSptTokenDataResultError:
            error = @"Error retrieving token data";
            //Any other error in the token patameters
            break;
        case kSptTokenDataResultServerNotReachable:
            error = @"Server not reachable";
            //Cannot reach server, try later?
            break;
        case kSptTokenDataResultInvalidToken:
            error = @"Invalid token";

            //Token is invalid, nothing else
            break;
    }

    if ( error != nil ){
      //  _activityIndicator.hidden = YES;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error connecting"
                                                                       message:error
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }
/*

    switch ( tokenDataResult.result ){
        case kSptTokenDataResultJoinMeeting:
            CollaborateUtils.Instance.loginMeetingSeqID = tokenDataResult.meetingSequenceID;
            break;
        case kSptTokenDataResultLogin:
            //Lets login with the given credentials
            [CollaborateUtils.Instance.api loginWithTokenDataResult:tokenDataResult];
            CollaborateUtils.Instance.loginMeetingSeqID = tokenDataResult.meetingSequenceID;
            break;
        case kSptTokenDataResultError:
            error = @"Error retrieving token data";
            //Any other error in the token patameters
            break;
        case kSptTokenDataResultServerNotReachable:
            error = @"Server not reachable";
            //Cannot reach server, try later?
            break;
        case kSptTokenDataResultInvalidToken:
            error = @"Invalid token";

            //Token is invalid, nothing else
            break;
    }

    if ( error != nil ){
        _activityIndicator.hidden = YES;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error connecting"
                                                                       message:error
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }

*/

}

@end
