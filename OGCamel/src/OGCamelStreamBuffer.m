/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamBuffer.h"

#import <OGio/OGCancellable.h>

@implementation OGCamelStreamBuffer

- (instancetype)initWithStream:(OGCamelStream*)stream mode:(CamelStreamBufferMode)mode
{
	CamelStreamBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_buffer_new([stream castedGObject], mode), CamelStreamBuffer, CamelStreamBuffer);

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

- (CamelStreamBuffer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamBuffer, CamelStreamBuffer);
}

- (void)discardCache
{
	camel_stream_buffer_discard_cache([self castedGObject]);
}

- (gint)sWithBuf:(OFString*)buf max:(guint)max cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_stream_buffer_gets([self castedGObject], g_strdup([buf UTF8String]), max, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)readLine:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gchar* gobjectValue = camel_stream_buffer_read_line([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end