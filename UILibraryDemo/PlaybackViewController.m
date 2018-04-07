#import "PlaybackViewController.h"
#import "DemoUtility.h"

@interface PlaybackViewController ()
@property (weak, nonatomic) IBOutlet UIView *fpvPreviewView;
- (IBAction)backBtnClickAction:(id)sender;
@end

@implementation PlaybackViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    firstly invoke the fetchCamera method of DemoUtility class to fetch the DJICamera object
    DJICamera *camera = [DemoUtility fetchCamera];
    
    if (camera != nil) {
//        setMode:withCompletion: method of DJICamera pass the DJICameraModePlayback param to switch the camera mode to playback
        
        [camera setMode:DJICameraModePlayback withCompletion:^(NSError * _Nullable error) {
            if (error) {
                ShowResult(@"Set CameraWorkModePlayback Failed, %@", error.description);
            }
        }];
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    DJICamera *camera = [DemoUtility fetchCamera];
//    invoke the setMode:withCompletion: method of DJICamera and pass the DJICameraModeShootPhoto param to switch the camera mode to shoot photo mode.
    [camera setMode:DJICameraModeShootPhoto withCompletion:^(NSError * _Nullable error) {
        if (error) {
            ShowResult(@"Set CameraWorkModeShootPhoto Failed, %@", error.description);
        }
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer* tapRecognizer = [ [UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapResponder:)];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapRecognizer];
}
//- todo
- (void)tapResponder: (UITapGestureRecognizer *)sender
{
    NSLog(@"Single tap detected");
}
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//    /*5.4 on Gantt Chart*/
//    - (IBAction)displayConfirmAlert {
//        self.stringAlertTitleConfirm0 = @"Confirm this object?";
//        self.stringAlertMessageConfirm0 = @"You just selected an object to land on";
//        self.stringAlertOktextConfirm0 = @"Confirm";
//        //UIAlertController* alert = [UIAlertController ]
//        UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:_stringAlertTitleConfirm0 message:_stringAlertMessageConfirm0 preferredStyle:UIAlertControllerStyleAlert];
//    //    UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
//        UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
//                                   {
//                                       [self handleImageGallery];
//                                   }];
//        [alertViewController addAction:okAction];
//        [self presentViewController:alertViewController animated:YES completion:nil];
//    }
//    - (IBAction)landingComplete {
//        self.stringAlertTitleConfirm0 = @"Landing Complete";
//        self.stringAlertMessageConfirm0 = @"You can control the drone with your remote now";
//        self.stringAlertOktextConfirm0 = @"Confirm";
//        //UIAlertController* alert = [UIAlertController ]
//        UIAlertController* alertViewController = [UIAlertController alertControllerWithTitle:_stringAlertTitleConfirm0 message:_stringAlertMessageConfirm0 preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* okAction = [UIAlertAction actionWithTitle:_stringAlertOktextConfirm0 style:UIAlertActionStyleDefault handler:nil];
//        [alertViewController addAction:okAction];
//        [self presentViewController:alertViewController animated:YES completion:nil];
//    }

    #pragma mark - IBAction Methods
- (IBAction)backBtnClickAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)handleImageGallery
{
    printf("this 'confirm' button has been pressed");
}
@end
