/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

#import "OGCamelStream.h"
#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>
#import <OGio/OGOutputStream.h>

@implementation OGCamelDataWrapper

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_DATA_WRAPPER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)dataWrapper
{
	CamelDataWrapper* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_data_wrapper_new(), CamelDataWrapper, CamelDataWrapper);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelDataWrapper* wrapperObject;
	@try {
		wrapperObject = [[OGCamelDataWrapper alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelDataWrapper*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelDataWrapper, CamelDataWrapper);
}

- (gsize)calculateDecodedSizeSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gsize returnValue = (gsize)camel_data_wrapper_calculate_decoded_size_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gsize)calculateSizeSyncWithCancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gsize returnValue = (gsize)camel_data_wrapper_calculate_size_sync([self castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)constructFromDataSync:(gconstpointer)data dataLen:(gssize)dataLen cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_data_wrapper_construct_from_data_sync([self castedGObject], data, dataLen, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)constructFromInputStream:(OGInputStream*)inputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_input_stream([self castedGObject], [inputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)constructFromInputStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_data_wrapper_construct_from_input_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)constructFromInputStreamSync:(OGInputStream*)inputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_data_wrapper_construct_from_input_stream_sync([self castedGObject], [inputStream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)constructFromStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_construct_from_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)constructFromStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)camel_data_wrapper_construct_from_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)constructFromStreamSync:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_data_wrapper_construct_from_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)decodeToOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_output_stream([self castedGObject], [outputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)decodeToOutputStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_decode_to_output_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)decodeToOutputStreamSync:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_decode_to_output_stream_sync([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)decodeToStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_decode_to_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)decodeToStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_decode_to_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)decodeToStreamSync:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_decode_to_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GByteArray*)byteArray
{
	GByteArray* returnValue = (GByteArray*)camel_data_wrapper_get_byte_array([self castedGObject]);

	return returnValue;
}

- (CamelTransferEncoding)encoding
{
	CamelTransferEncoding returnValue = (CamelTransferEncoding)camel_data_wrapper_get_encoding([self castedGObject]);

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
	CamelContentType* returnValue = (CamelContentType*)camel_data_wrapper_get_mime_type_field([self castedGObject]);

	return returnValue;
}

- (bool)isOffline
{
	bool returnValue = (bool)camel_data_wrapper_is_offline([self castedGObject]);

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

- (void)writeToOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_output_stream([self castedGObject], [outputStream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)writeToOutputStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_write_to_output_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)writeToOutputStreamSync:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_write_to_output_stream_sync([self castedGObject], [outputStream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)writeToStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_data_wrapper_write_to_stream([self castedGObject], [stream castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (gssize)writeToStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_write_to_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gssize)writeToStreamSync:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_data_wrapper_write_to_stream_sync([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end