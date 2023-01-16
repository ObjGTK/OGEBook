/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNullOutputStream.h"

@implementation OGCamelNullOutputStream

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_null_output_stream_new()];

	return self;
}

- (CamelNullOutputStream*)NULLOUTPUTSTREAM
{
	return CAMEL_NULL_OUTPUT_STREAM([self GOBJECT]);
}

- (gsize)bytesWritten
{
	return camel_null_output_stream_get_bytes_written([self NULLOUTPUTSTREAM]);
}

- (bool)endsWithCrlf
{
	return camel_null_output_stream_get_ends_with_crlf([self NULLOUTPUTSTREAM]);
}


@end