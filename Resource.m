// 
//  Resource.m
//  BlogAssistant
//
//  Created by 橋口 湖 on 10/01/18.
//  Copyright 2010 xcatsan.com. All rights reserved.
//

#import "Resource.h"
#import "CoreDataManager.h"
#import "ImageManager.h"

@implementation Resource 

@dynamic createdDate;
@dynamic imageFilename;
@dynamic title;
@dynamic url;
@dynamic uuid;

@synthesize image;

- (NSImage*)image
{
	if (!image && self.imageFilename) {
		self.image = [[ImageManager sharedManager]
					  readImageWithFilename:self.imageFilename];
	}
	return image;
}

#pragma mark -
#pragma mark Delegation
- (void) awakeFromInsert {
    [super awakeFromInsert];
	[self setPrimitiveValue:[NSDate date] forKey:@"createdDate"];
}
@end
