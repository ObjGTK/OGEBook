/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelNullOutputStream.h"

@implementation OGCamelNullOutputStream

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_NULL_OUTPUT_STREAM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

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
	gsize returnValue = (gsize)camel_null_output_stream_get_bytes_written([self castedGObject]);

	return returnValue;
}

- (bool)endsWithCrlf
{
	bool returnValue = (bool)camel_null_output_stream_get_ends_with_crlf([self castedGObject]);

	return returnValue;
}


@end