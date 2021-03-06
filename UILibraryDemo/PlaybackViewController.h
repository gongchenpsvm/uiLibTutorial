//
//  PlaybackViewController.h
//  UILibraryDemo
//
//  Created by Gong Chen on 19/02/2018.
//  Copyright © 2018 Gong Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILibraryDemo-Swift.h"
@interface PlaybackViewController : UIViewController <UITextFieldDelegate>{
    ExecutiveControl* ec_ptr;
}
@property (nonatomic,strong) NSString* stringAlertTitleConfirm0;
@property (nonatomic,strong) NSString* stringAlertMessageConfirm0;
@property (nonatomic,strong) NSString* stringAlertOktextConfirm0;

@property (nonatomic,strong) NSString* stringAlertTitleConfirm1;
@property (nonatomic,strong) NSString* stringAlertMessageConfirm1;
@property (nonatomic,strong) NSString* stringAlertOktextConfirm1;
@property (weak, nonatomic) IBOutlet UITextField *errorMessageInput;

@end
