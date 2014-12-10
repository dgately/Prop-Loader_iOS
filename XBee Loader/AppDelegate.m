//
//  AppDelegate.m
//  Prop Loader
//
//  Created by Mike Westerfield on 2/10/14 at the Byte Works, Inc.
//  Copyright (c) 2014 Parallax. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {
    
    // Copy content of all files with .binary extensions into the sandbox
    NSArray *files = [[NSBundle mainBundle] pathsForResourcesOfType: @"binary" inDirectory: Nil];
    
    for (NSString *filePath in files) {
        
        // Pull the actual filename from its path
        NSString *fileName = [filePath lastPathComponent];
        fileName    = [fileName stringByDeletingPathExtension];
        NSData *fileContents = [[NSData alloc] initWithContentsOfFile: filePath];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex: 0];
        path = [path stringByAppendingPathComponent: [fileName stringByAppendingPathExtension: @"binary"]];
        [fileContents writeToFile: path atomically: YES];
    }
    
    // Set the working directory to the sandbox.
    return YES;
}
							
- (void) applicationWillResignActive: (UIApplication *) application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void) applicationDidEnterBackground: (UIApplication *) application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void) applicationWillEnterForeground: (UIApplication *) application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void) applicationDidBecomeActive: (UIApplication *) application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void) applicationWillTerminate: (UIApplication *) application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
