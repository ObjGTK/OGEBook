/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfo.h"

#import "OGCamelFolder.h"
#import "OGCamelFolderSummary.h"

@implementation OGCamelVeeMessageInfo

- (instancetype)initWithSummary:(OGCamelFolderSummary*)summary originalSummary:(OGCamelFolderSummary*)originalSummary vuid:(OFString*)vuid
{
	self = [super initWithGObject:(GObject*)camel_vee_message_info_new([summary FOLDERSUMMARY], [originalSummary FOLDERSUMMARY], [vuid UTF8String])];

	return self;
}

- (CamelVeeMessageInfo*)VEEMESSAGEINFO
{
	return CAMEL_VEE_MESSAGE_INFO([self GOBJECT]);
}

- (OGCamelFolder*)originalFolder
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_vee_message_info_get_original_folder([self VEEMESSAGEINFO])] autorelease];
}

- (OGCamelFolderSummary*)originalSummary
{
	return [[[OGCamelFolderSummary alloc] initWithGObject:(GObject*)camel_vee_message_info_get_original_summary([self VEEMESSAGEINFO])] autorelease];
}


@end