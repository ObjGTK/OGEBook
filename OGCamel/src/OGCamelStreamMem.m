/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamMem.h"

@implementation OGCamelStreamMem

- (instancetype)init
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new(), CamelStreamMem, CamelStreamMem);

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

- (instancetype)initWithBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new_with_buffer([buffer UTF8String], len), CamelStreamMem, CamelStreamMem);

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

- (instancetype)initWithByteArray:(GByteArray*)buffer
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new_with_byte_array(buffer), CamelStreamMem, CamelStreamMem);

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

- (CamelStreamMem*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamMem, CamelStreamMem);
}

- (GByteArray*)byteArray
{
	GByteArray* returnValue = camel_stream_mem_get_byte_array([self castedGObject]);

	return returnValue;
}

- (void)setBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	camel_stream_mem_set_buffer([self castedGObject], [buffer UTF8String], len);
}

- (void)setByteArray:(GByteArray*)buffer
{
	camel_stream_mem_set_byte_array([self castedGObject], buffer);
}

- (void)setSecure
{
	camel_stream_mem_set_secure([self castedGObject]);
}


@end