/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStream.h"

#import <OGio/OGIOStream.h>
#import <OGio/OGCancellable.h>

@implementation OGCamelStream

- (instancetype)init:(OGIOStream*)baseStream
{
	CamelStream* gobjectValue = CAMEL_STREAM(camel_stream_new([baseStream castedGObject]));

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

- (CamelStream*)castedGObject
{
	return CAMEL_STREAM([self gObject]);
}

- (gint)close:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_stream_close([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)eos
{
	bool returnValue = camel_stream_eos([self castedGObject]);

	return returnValue;
}

- (gint)flush:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = camel_stream_flush([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)readWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_stream_read([self castedGObject], g_strdup([buffer UTF8String]), n, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGIOStream*)refBaseStream
{
	GIOStream* gobjectValue = G_IO_STREAM(camel_stream_ref_base_stream([self castedGObject]));

	OGIOStream* returnValue = [OGIOStream wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setBaseStream:(OGIOStream*)baseStream
{
	camel_stream_set_base_stream([self castedGObject], [baseStream castedGObject]);
}

- (gssize)writeWithBuffer:(OFString*)buffer n:(gsize)n cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_stream_write([self castedGObject], [buffer UTF8String], n, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)writeStringWithString:(OFString*)string cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_stream_write_string([self castedGObject], [string UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)writeToStreamWithOutputStream:(OGCamelStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_stream_write_to_stream([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end