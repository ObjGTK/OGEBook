/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamMem.h"

@implementation OGCamelStreamMem

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_stream_mem_new()];

	return self;
}

- (instancetype)initWithBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	self = [super initWithGObject:(GObject*)camel_stream_mem_new_with_buffer([buffer UTF8String], len)];

	return self;
}

- (instancetype)initWithByteArray:(GByteArray*)buffer
{
	self = [super initWithGObject:(GObject*)camel_stream_mem_new_with_byte_array(buffer)];

	return self;
}

- (CamelStreamMem*)STREAMMEM
{
	return CAMEL_STREAM_MEM([self GOBJECT]);
}

- (GByteArray*)byteArray
{
	return camel_stream_mem_get_byte_array([self STREAMMEM]);
}

- (void)setBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	camel_stream_mem_set_buffer([self STREAMMEM], [buffer UTF8String], len);
}

- (void)setByteArray:(GByteArray*)buffer
{
	camel_stream_mem_set_byte_array([self STREAMMEM], buffer);
}

- (void)setSecure
{
	camel_stream_mem_set_secure([self STREAMMEM]);
}


@end