/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSummary.h"

#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeMessageInfo.h"
#import "OGCamelFolder.h"

@implementation OGCamelVeeSummary

- (instancetype)init:(OGCamelFolder*)parent
{
	self = [super initWithGObject:(GObject*)camel_vee_summary_new([parent FOLDER])];

	return self;
}

- (CamelVeeSummary*)VEESUMMARY
{
	return CAMEL_VEE_SUMMARY([self GOBJECT]);
}

- (OGCamelVeeMessageInfo*)add:(OGCamelVeeMessageInfoData*)miData
{
	return [[[OGCamelVeeMessageInfo alloc] initWithGObject:(GObject*)camel_vee_summary_add([self VEESUMMARY], [miData VEEMESSAGEINFODATA])] autorelease];
}

- (GHashTable*)uidsForSubfolder:(OGCamelFolder*)subfolder
{
	return camel_vee_summary_get_uids_for_subfolder([self VEESUMMARY], [subfolder FOLDER]);
}

- (void)removeWithVuid:(OFString*)vuid subfolder:(OGCamelFolder*)subfolder
{
	camel_vee_summary_remove([self VEESUMMARY], [vuid UTF8String], [subfolder FOLDER]);
}

- (void)replaceFlags:(OFString*)uid
{
	camel_vee_summary_replace_flags([self VEESUMMARY], [uid UTF8String]);
}


@end