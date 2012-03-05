//
//  LBAppDelegate.h
//  ClickScroll
//
//  Created by Lee Baker on 3/2/12.
//  Copyright (c) 2012 LCB. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LBAppDelegate : NSObject <NSApplicationDelegate>
{
	NSAppleScript * up_script;
	NSAppleScript * down_script;
	NSWindow * _window;
}

- (IBAction)scrollUp:(id)sender;
- (IBAction)scrollDown:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
