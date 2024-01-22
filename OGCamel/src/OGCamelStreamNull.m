/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamNull.h"

@implementation OGCamelStreamNull

- (instancetype)init
{
	CamelStreamNull* gobjectValue = CAMEL_STREAM_NULL(camel_stream_null_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelStreamNull*)castedGObject
{
	return CAMEL_STREAM_NULL([self gObject]);
}

- (gsize)bytesWritten
{
	gsize returnValue = camel_stream_null_get_bytes_written([self castedGObject]);

	return returnValue;
}

- (bool)endsWithCrlf
{
	bool returnValue = camel_stream_null_get_ends_with_crlf([self castedGObject]);

	return returnValue;
}


@end