/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamNull.h"

@implementation OGCamelStreamNull

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_stream_null_new()];

	return self;
}

- (CamelStreamNull*)STREAMNULL
{
	return CAMEL_STREAM_NULL([self GOBJECT]);
}

- (gsize)bytesWritten
{
	return camel_stream_null_get_bytes_written([self STREAMNULL]);
}

- (bool)endsWithCrlf
{
	return camel_stream_null_get_ends_with_crlf([self STREAMNULL]);
}


@end