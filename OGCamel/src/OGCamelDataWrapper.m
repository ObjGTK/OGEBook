/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

#import "OGCamelStream.h"

@implementation OGCamelDataWrapper

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_data_wrapper_new()];

	return self;
}

- (CamelDataWrapper*)DATAWRAPPER
{
	return CAMEL_DATA_WRAPPER([self GOBJECT]);
}

- (gsize)calculateDecodedSizeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_calculate_decoded_size_sync([self DATAWRAPPER], cancellable, err);
}

- (gsize)calculateSizeSyncWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_calculate_size_sync([self DATAWRAPPER], cancellable, err);
}

- (void)constructFromInputStreamWithInputStream:(GInputStream*)inputStream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_input_stream([self DATAWRAPPER], inputStream, ioPriority, cancellable, callback, userData);
}

- (bool)constructFromInputStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_construct_from_input_stream_finish([self DATAWRAPPER], result, err);
}

- (bool)constructFromInputStreamSyncWithInputStream:(GInputStream*)inputStream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_construct_from_input_stream_sync([self DATAWRAPPER], inputStream, cancellable, err);
}

- (void)constructFromStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_stream([self DATAWRAPPER], [stream STREAM], ioPriority, cancellable, callback, userData);
}

- (bool)constructFromStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_construct_from_stream_finish([self DATAWRAPPER], result, err);
}

- (bool)constructFromStreamSyncWithStream:(OGCamelStream*)stream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_construct_from_stream_sync([self DATAWRAPPER], [stream STREAM], cancellable, err);
}

- (void)decodeToOutputStreamWithOutputStream:(GOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_output_stream([self DATAWRAPPER], outputStream, ioPriority, cancellable, callback, userData);
}

- (gssize)decodeToOutputStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_decode_to_output_stream_finish([self DATAWRAPPER], result, err);
}

- (gssize)decodeToOutputStreamSyncWithOutputStream:(GOutputStream*)outputStream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_decode_to_output_stream_sync([self DATAWRAPPER], outputStream, cancellable, err);
}

- (void)decodeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_stream([self DATAWRAPPER], [stream STREAM], ioPriority, cancellable, callback, userData);
}

- (gssize)decodeToStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_decode_to_stream_finish([self DATAWRAPPER], result, err);
}

- (gssize)decodeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_decode_to_stream_sync([self DATAWRAPPER], [stream STREAM], cancellable, err);
}

- (GByteArray*)byteArray
{
	return camel_data_wrapper_get_byte_array([self DATAWRAPPER]);
}

- (CamelTransferEncoding)encoding
{
	return camel_data_wrapper_get_encoding([self DATAWRAPPER]);
}

- (OFString*)mimeType
{
	return [OFString stringWithUTF8String:camel_data_wrapper_get_mime_type([self DATAWRAPPER])];
}

- (CamelContentType*)mimeTypeField
{
	return camel_data_wrapper_get_mime_type_field([self DATAWRAPPER]);
}

- (bool)isOffline
{
	return camel_data_wrapper_is_offline([self DATAWRAPPER]);
}

- (void)setEncoding:(CamelTransferEncoding)encoding
{
	camel_data_wrapper_set_encoding([self DATAWRAPPER], encoding);
}

- (void)setMimeType:(OFString*)mimeType
{
	camel_data_wrapper_set_mime_type([self DATAWRAPPER], [mimeType UTF8String]);
}

- (void)setMimeTypeField:(CamelContentType*)mimeType
{
	camel_data_wrapper_set_mime_type_field([self DATAWRAPPER], mimeType);
}

- (void)setOffline:(bool)offline
{
	camel_data_wrapper_set_offline([self DATAWRAPPER], offline);
}

- (void)takeMimeTypeField:(CamelContentType*)mimeType
{
	camel_data_wrapper_take_mime_type_field([self DATAWRAPPER], mimeType);
}

- (void)writeToOutputStreamWithOutputStream:(GOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_output_stream([self DATAWRAPPER], outputStream, ioPriority, cancellable, callback, userData);
}

- (gssize)writeToOutputStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_write_to_output_stream_finish([self DATAWRAPPER], result, err);
}

- (gssize)writeToOutputStreamSyncWithOutputStream:(GOutputStream*)outputStream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_write_to_output_stream_sync([self DATAWRAPPER], outputStream, cancellable, err);
}

- (void)writeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_stream([self DATAWRAPPER], [stream STREAM], ioPriority, cancellable, callback, userData);
}

- (gssize)writeToStreamFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_data_wrapper_write_to_stream_finish([self DATAWRAPPER], result, err);
}

- (gssize)writeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_data_wrapper_write_to_stream_sync([self DATAWRAPPER], [stream STREAM], cancellable, err);
}


@end