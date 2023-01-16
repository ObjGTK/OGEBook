/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeMessageInfoData.h"

#import "OGCamelVeeSubfolderData.h"

@implementation OGCamelVeeMessageInfoData

- (instancetype)initWithSubfolderData:(OGCamelVeeSubfolderData*)subfolderData origMessageUid:(OFString*)origMessageUid
{
	self = [super initWithGObject:(GObject*)camel_vee_message_info_data_new([subfolderData VEESUBFOLDERDATA], [origMessageUid UTF8String])];

	return self;
}

- (CamelVeeMessageInfoData*)VEEMESSAGEINFODATA
{
	return CAMEL_VEE_MESSAGE_INFO_DATA([self GOBJECT]);
}

- (OFString*)origMessageUid
{
	return [OFString stringWithUTF8String:camel_vee_message_info_data_get_orig_message_uid([self VEEMESSAGEINFODATA])];
}

- (OGCamelVeeSubfolderData*)subfolderData
{
	return [[[OGCamelVeeSubfolderData alloc] initWithGObject:(GObject*)camel_vee_message_info_data_get_subfolder_data([self VEEMESSAGEINFODATA])] autorelease];
}

- (OFString*)veeMessageUid
{
	return [OFString stringWithUTF8String:camel_vee_message_info_data_get_vee_message_uid([self VEEMESSAGEINFODATA])];
}


@end