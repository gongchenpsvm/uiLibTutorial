//
//  DefaultLayoutViewController.m
//  UILibraryDemo
//
//  Created by Gong Chen on 21/01/2018.
//  Copyright © 2018 Gong Chen. All rights reserved.


#import "DefaultLayoutViewController.h"
#import <DJISDK/DJISDK.h>
@interface DefaultLayoutViewController ()<DJIVideoFeedListener, DJISDKManagerDelegate, DJICameraDelegate>
//@property (weak, nonatomic) IBOutlet UIButton *recordBtn;
//- (IBAction)recordAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *playbackBtn;
@end

@implementation DefaultLayoutViewController
@synthesize stateLabel;
@synthesize stateName;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Please enter your App Key in the info.plist file.
    [DJISDKManager registerAppWithDelegate:self];
    [self.playbackBtn setImage:[UIImage imageNamed:@"playback_icon"]
                      forState:UIControlStateNormal];
    stateLabel.text = stateName;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self registerApp];
    ec_ptr = [[ExecutiveControl alloc] init];
}

- (void)registerApp
{
    [DJISDKManager registerAppWithDelegate:self];
}

- (void)showAlertViewWithMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertViewController addAction:okAction];
        UIViewController *rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
        [rootViewController presentViewController:alertViewController animated:YES completion:nil];
    });
}

#pragma mark DJISDKManager Delegate Methods
- (void)appRegisteredWithError:(NSError *)error
{
    if (!error) {
        [self showAlertViewWithMessage:@"Registration Success"];
        [DJISDKManager startConnectionToProduct];
    }else
    {
        [self showAlertViewWithMessage:[NSString stringWithFormat:@"Registration Error:%@", error]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)sendReadyToLand:(id)sender {
//
//}


/*5.3 on Gantt chart*/
- (IBAction)displayCVError {
    
    self.stringAlertTitleConfirm0 = @"No targets found";
    self.stringAlertMessageConfirm0 = @"Adjust the camera";
    self.stringAlertOktextConfirm0 = @"Confirm";
    //UIAlertController* alert = [UIAlertController ]
    UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:_stringAlertTitleConfirm0 message:_stringAlertMessageConfirm0 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:YES completion:nil];
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:@"alert" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"OK BUTTON PRESSED");
//    }];
//    [alert addAction:actionOk];
//    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}
/*5.4 on Gantt Chart*/
- (IBAction)displayConfirmAlert {
    self.stringAlertTitleConfirm0 = @"Confirm this object?";
    self.stringAlertMessageConfirm0 = @"You just selected an object to land on";
    self.stringAlertOktextConfirm0 = @"Confirm";
    //UIAlertController* alert = [UIAlertController ]
    UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:_stringAlertTitleConfirm0 message:_stringAlertMessageConfirm0 preferredStyle:UIAlertControllerStyleAlert];
    //    UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:YES completion:nil];
}
- (IBAction)landingComplete {
    self.stringAlertTitleConfirm0 = @"Landing Complete";
    self.stringAlertMessageConfirm0 = @"You can control the drone with your remote now";
    self.stringAlertOktextConfirm0 = @"Confirm";
    //UIAlertController* alert = [UIAlertController ]
    UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:_stringAlertTitleConfirm0 message:_stringAlertMessageConfirm0 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)btnReadyToLand:(id)sender {
    NSLog(@"Something To Print");
    [ec_ptr readToLand];
}
@end
