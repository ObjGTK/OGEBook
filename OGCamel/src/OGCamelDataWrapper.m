/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>
#import "OGCamelStream.h"
#import <OGio/OGInputStream.h>

@implementation OGCamelDataWrapper

- (instancetype)init
{
	CamelDataWrapper* gobjectValue = CAMEL_DATA_WRAPPER(camel_data_wrapper_new());

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

- (CamelDataWrapper*)castedGObject
{
	return CAMEL_DATA_WRAPPER([self gObject]);
}

- (gsize)calculateDecodedSizeSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gsize returnValue = camel_data_wrapper_calculate_decoded_size_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gsize)calculateSizeSync:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gsize returnValue = camel_data_wrapper_calculate_size_sync([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)constructFromDataSyncWithData:(gconstpointer)data dataLen:(gssize)dataLen cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_data_wrapper_construct_from_data_sync([self castedGObject], data, dataLen, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)constructFromInputStreamWithInputStream:(OGInputStream*)inputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_input_stream([self castedGObject], [inputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)constructFromInputStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_data_wrapper_construct_from_input_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)constructFromInputStreamSyncWithInputStream:(OGInputStream*)inputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_data_wrapper_construct_from_input_stream_sync([self castedGObject], [inputStream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)constructFromStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)constructFromStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_data_wrapper_construct_from_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)constructFromStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_data_wrapper_construct_from_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)decodeToOutputStreamWithOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_output_stream([self castedGObject], [outputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)decodeToOutputStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_decode_to_output_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)decodeToOutputStreamSyncWithOutputStream:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_decode_to_output_stream_sync([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)decodeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)decodeToStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_decode_to_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)decodeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_decode_to_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (GByteArray*)byteArray
{
	GByteArray* returnValue = camel_data_wrapper_get_byte_array([self castedGObject]);

	return returnValue;
}

- (CamelTransferEncoding)encoding
{
	CamelTransferEncoding returnValue = camel_data_wrapper_get_encoding([self castedGObject]);

	return returnValue;
}

- (OFString*)mimeType
{
	gchar* gobjectValue = camel_data_wrapper_get_mime_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (CamelContentType*)mimeTypeField
{
	CamelContentType* returnValue = camel_data_wrapper_get_mime_type_field([self castedGObject]);

	return returnValue;
}

- (bool)isOffline
{
	bool returnValue = camel_data_wrapper_is_offline([self castedGObject]);

	return returnValue;
}

- (void)setEncoding:(CamelTransferEncoding)encoding
{
	camel_data_wrapper_set_encoding([self castedGObject], encoding);
}

- (void)setMimeType:(OFString*)mimeType
{
	camel_data_wrapper_set_mime_type([self castedGObject], [mimeType UTF8String]);
}

- (void)setMimeTypeField:(CamelContentType*)mimeType
{
	camel_data_wrapper_set_mime_type_field([self castedGObject], mimeType);
}

- (void)setOffline:(bool)offline
{
	camel_data_wrapper_set_offline([self castedGObject], offline);
}

- (void)takeMimeTypeField:(CamelContentType*)mimeType
{
	camel_data_wrapper_take_mime_type_field([self castedGObject], mimeType);
}

- (void)writeToOutputStreamWithOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_output_stream([self castedGObject], [outputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)writeToOutputStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_write_to_output_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)writeToOutputStreamSyncWithOutputStream:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_write_to_output_stream_sync([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)writeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)writeToStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_write_to_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gssize)writeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = camel_data_wrapper_write_to_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end