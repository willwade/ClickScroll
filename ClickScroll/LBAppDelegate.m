//
//  LBAppDelegate.m
//  ClickScroll
//
//  Created by Lee Baker on 3/2/12.
//  Copyright (c) 2012 LCB. All rights reserved.
//

#import "LBAppDelegate.h"

@implementation LBAppDelegate

@synthesize window = _window;

- (void)awakeFromNib
{
	//Set the window to float above others
	[self.window setLevel:NSPopUpMenuWindowLevel];
	
	// Setting the window as partially transparent
	// is useful if you want to see stuff hidden
	// behind the window.
	[self.window setAlphaValue:0.75];
}

//when passed a keycode, simulates a key press (both down and up).
- (void) postKeyEventForKey:(int) key_id
{
	CGEventRef event_key_down = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)key_id, true);
	CGEventRef event_key_up = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)key_id, false);
	CGEventPost(kCGSessionEventTap, event_key_down);
	CGEventPost(kCGSessionEventTap, event_key_up);
	CFRelease(event_key_down);
	CFRelease(event_key_up);
}

// Keys that are useful: 
// 116 - page up
// 121 - page dn
//
// 126 - up arrow
// 125 - down arrow
//
// More keycodes can be found in Events.h in the Carbon framework, or at
// http://boredzo.org/blog/wp-content/uploads/2007/05/imtx-virtual-keycodes.png

Boolean DOUBLE_CLICK_PAGE_SCROLL = true;

- (IBAction)scrollUp:(id)sender
{
if (DOUBLE_CLICK_PAGE_SCROLL)
	if([NSApplication sharedApplication].currentEvent.clickCount == 2)
		[self postKeyEventForKey:116];
	else
		[self postKeyEventForKey:126];
else
	[self postKeyEventForKey:126];
}

- (IBAction)scrollDown:(id)sender
{
if (DOUBLE_CLICK_PAGE_SCROLL)
	if([NSApplication sharedApplication].currentEvent.clickCount == 2)
		[self postKeyEventForKey:121];
	else
		[self postKeyEventForKey:125];
else
	[self postKeyEventForKey:125];
}

- (void)dealloc
{
    [super dealloc];
}

// Make sure the application quits when the last window is closed.
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
	return YES;
}

@end
