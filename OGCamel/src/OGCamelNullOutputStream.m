/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNullOutputStream.h"

@implementation OGCamelNullOutputStream

- (instancetype)init
{
	CamelNullOutputStream* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_null_output_stream_new(), CamelNullOutputStream, CamelNullOutputStream);

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

- (CamelNullOutputStream*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelNullOutputStream, CamelNullOutputStream);
}

- (gsize)bytesWritten
{
	gsize returnValue = camel_null_output_stream_get_bytes_written([self castedGObject]);

	return returnValue;
}

- (bool)endsWithCrlf
{
	bool returnValue = camel_null_output_stream_get_ends_with_crlf([self castedGObject]);

	return returnValue;
}


@end