//
//  DefaultLayoutViewController.h
//  UILibraryDemo
//
//  Created by Gong Chen on 21/01/2018.
//  Copyright © 2018 Gong Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DJIUILibrary/DJIUILibrary.h>
#import "UILibraryDemo-Swift.h"

@interface DefaultLayoutViewController : DULDefaultLayoutViewController {
    ExecutiveControl* ec_ptr;
}
- (IBAction)btnReadyToLand:(id)sender;
@property (nonatomic,strong) NSString* stringAlertTitleConfirm0;
@property (nonatomic,strong) NSString* stringAlertMessageConfirm0;
@property (nonatomic,strong) NSString* stringAlertOktextConfirm0;
@property (nonatomic, strong) IBOutlet UILabel *stateLabel;
@property (nonatomic, strong) NSString *stateName;
@end
