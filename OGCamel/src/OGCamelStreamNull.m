/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamNull.h"

@implementation OGCamelStreamNull

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_NULL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	CamelStreamNull* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_null_new(), CamelStreamNull, CamelStreamNull);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamNull, CamelStreamNull);
}

- (gsize)bytesWritten
{
	gsize returnValue = (gsize)camel_stream_null_get_bytes_written([self castedGObject]);

	return returnValue;
}

- (bool)endsWithCrlf
{
	bool returnValue = (bool)camel_stream_null_get_ends_with_crlf([self castedGObject]);

	return returnValue;
}


@end