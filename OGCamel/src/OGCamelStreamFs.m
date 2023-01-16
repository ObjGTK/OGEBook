/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFs.h"

@implementation OGCamelStreamFs

- (instancetype)initWithFd:(gint)fd
{
	self = [super initWithGObject:(GObject*)camel_stream_fs_new_with_fd(fd)];

	return self;
}

- (instancetype)initWithNameWithName:(OFString*)name flags:(gint)flags mode:(mode_t)mode err:(GError**)err
{
	self = [super initWithGObject:(GObject*)camel_stream_fs_new_with_name([name UTF8String], flags, mode, err)];

	return self;
}

- (CamelStreamFs*)STREAMFS
{
	return CAMEL_STREAM_FS([self GOBJECT]);
}

- (gint)fd
{
	return camel_stream_fs_get_fd([self STREAMFS]);
}


@end