//
//  CoronaFacebookDelegate.m
//  Plugin
//
//  Created by Alexander McCaleb on 8/4/15.
//
//

#import "CoronaFacebookDelegate.h"
#import "CoronaRuntime.h"
#import "CoronaDelegate.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <SafariServices/SafariServices.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit-Swift.h>


@implementation CoronaFacebookDelegate

- (void)willLoadMain:(id<CoronaRuntime>)runtime
{
}

- (void)didLoadMain:(id<CoronaRuntime>)runtime
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive.
	// If the application was previously in the background, optionally refresh the user interface.
	// TODO: NOT FORCE THIS DOWN DEVELOPER'S THROATS AS WE LET THEM OPT-IN WITH PUBLISHINSTALL ON BOTH PLATFORMS!
    
    if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"FacebookClientToken"]) {
        //[FBSDKAppEvents.shared activateApp];
    }else{
        UIAlertController *showMsgAlertController = [UIAlertController alertControllerWithTitle:@"Missing Facebook Client Token" message:@"Facebook now requires a client token which you are missing in your build.settings, see documentation for more information https://docs.coronalabs.com/plugin/facebook-v4a" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {
            exit(0);
        }];
        [showMsgAlertController addAction:okAction];
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:showMsgAlertController animated:YES completion:nil];
        });
    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"FacebookClientToken"]) {
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                        didFinishLaunchingWithOptions:launchOptions];
    }else{
        return YES;
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"FacebookClientToken"]) {
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                              openURL:url
                                                    sourceApplication:sourceApplication
                                                           annotation:annotation];
    }else{
        return YES;
    }
	
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"FacebookClientToken"]) {
        return [[FBSDKApplicationDelegate sharedInstance] application:app openURL:url options:options];
    }else{
        return YES;
    }
	
}

@end
