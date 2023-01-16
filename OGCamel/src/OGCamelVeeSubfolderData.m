/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeSubfolderData.h"

#import "OGCamelFolder.h"

@implementation OGCamelVeeSubfolderData

- (instancetype)init:(OGCamelFolder*)folder
{
	self = [super initWithGObject:(GObject*)camel_vee_subfolder_data_new([folder FOLDER])];

	return self;
}

- (CamelVeeSubfolderData*)VEESUBFOLDERDATA
{
	return CAMEL_VEE_SUBFOLDER_DATA([self GOBJECT]);
}

- (OGCamelFolder*)folder
{
	return [[[OGCamelFolder alloc] initWithGObject:(GObject*)camel_vee_subfolder_data_get_folder([self VEESUBFOLDERDATA])] autorelease];
}

- (OFString*)folderId
{
	return [OFString stringWithUTF8String:camel_vee_subfolder_data_get_folder_id([self VEESUBFOLDERDATA])];
}


@end