//
//  CustomCellImage.m
//  CustomCellWithCoredata
//
//  Created by 橋口 湖 on 09/12/17.
//  Copyright 2009 xcatsan.com. All rights reserved.
//

#import "CustomCellImage.h" 

#import "ModelController.h"

#define SHADOW_OFFSET	5.0

@implementation CustomCellImage

// #TODO: Shrink image
// #TODO: Generalization ( take out getting NSImage process)
- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
				state:(NSInteger)buttonState value:(id)value
{
	NSString* imageFilename = [value valueForKey:self.keyPath];
	NSString* imagePath = [[ModelController sharedController] pathToSaveImage];
	NSImage* image = [[[NSImage alloc] initWithContentsOfFile:
					  [imagePath stringByAppendingPathComponent:imageFilename]] autorelease];
	
	// #TODO: for 10.6
	[image setFlipped:YES];
	NSRect imageFrame = self.frame;
	imageFrame.origin.x += cellFrame.origin.x;
	imageFrame.origin.y += cellFrame.origin.y;
	[image drawInRect:imageFrame
			 fromRect:NSZeroRect
			operation:NSCompositeSourceOver
			 fraction:1.0];
	
	/*
	imageFrame.origin.x += cellFrame.origin.x + SHADOW_OFFSET;
	imageFrame.origin.y += cellFrame.origin.y + SHADOW_OFFSET;
	imageFrame.size.width -= SHADOW_OFFSET*2;
	imageFrame.size.height -= SHADOW_OFFSET*2;

	// #TODO: for 10.6
	[image setFlipped:YES];
	
	NSShadow* shadow = [[[NSShadow alloc] init] autorelease];
	[shadow setShadowBlurRadius:SHADOW_OFFSET];
	[shadow setShadowOffset:NSMakeSize(SHADOW_OFFSET/1.5, -SHADOW_OFFSET/1.5)];
	[shadow setShadowColor:[[NSColor blackColor] colorWithAlphaComponent:0.5]];
	
	NSBezierPath* path = [NSBezierPath bezierPathWithRoundedRect:imageFrame
														 xRadius:5.0
														 yRadius:5.0];
	[NSGraphicsContext saveGraphicsState];
	[shadow set];
	[path fill];
	[NSGraphicsContext restoreGraphicsState];
	
	[NSGraphicsContext saveGraphicsState];
	[path setClip];
	[image drawInRect:imageFrame
			 fromRect:NSZeroRect
			operation:NSCompositeSourceOver
			 fraction:1.0];
	[NSGraphicsContext restoreGraphicsState];
	 */
}
@end