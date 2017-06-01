
#import "CDVPhoneCallTrap.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>

@implementation CDVPhoneCallTrap

- (void) onCall:(CDVInvokedUrlCommand*)command
{
    self.callCenter = [[CTCallCenter alloc] init];
    
    self.callCenter.callEventHandler = ^(CTCall *call) {
        
        NSString *callState = @"Ringing";
        
        if ([call.callState isEqualToString: CTCallStateConnected])
        {
            NSLog(@"OFFHOOK");
            callState = @"Connected";
        }
        else if ([call.callState isEqualToString: CTCallStateDialing])
        {
        }
        else if ([call.callState isEqualToString: CTCallStateDisconnected])
        {
            NSLog(@"IDLE");
            callState = @"IDLE";
        }
        else if ([call.callState isEqualToString: CTCallStateIncoming])
        {
            NSLog(@"RINGING");
            callState = @"RINGING";
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString* jsMethod = [NSString stringWithFormat:@"phoneEventCallBack('%@');", callState];
            [self.webViewEngine evaluateJavaScript:jsMethod completionHandler:^(id identifier, NSError *error) {}];
        });
    };
}

@end
