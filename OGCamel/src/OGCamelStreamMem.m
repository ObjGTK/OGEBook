/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamMem.h"

@implementation OGCamelStreamMem

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_MEM;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)streamMem
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new(), CamelStreamMem, CamelStreamMem);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamMem* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamMem alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)streamMemWithBuffer:(OFString*)buffer len:(gsize)len
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new_with_buffer([buffer UTF8String], len), CamelStreamMem, CamelStreamMem);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamMem* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamMem alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)streamMemWithByteArrayWithBuffer:(GByteArray*)buffer
{
	CamelStreamMem* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_mem_new_with_byte_array(buffer), CamelStreamMem, CamelStreamMem);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamMem* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamMem alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStreamMem*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamMem, CamelStreamMem);
}

- (GByteArray*)byteArray
{
	GByteArray* returnValue = (GByteArray*)camel_stream_mem_get_byte_array([self castedGObject]);

	return returnValue;
}

- (void)setBuffer:(OFString*)buffer len:(gsize)len
{
	camel_stream_mem_set_buffer([self castedGObject], [buffer UTF8String], len);
}

- (void)setByteArrayWithBuffer:(GByteArray*)buffer
{
	camel_stream_mem_set_byte_array([self castedGObject], buffer);
}

- (void)setSecure
{
	camel_stream_mem_set_secure([self castedGObject]);
}


@end