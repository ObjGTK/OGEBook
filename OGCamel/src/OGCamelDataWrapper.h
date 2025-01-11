/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelStream;
@class OGCancellable;
@class OGInputStream;
@class OGOutputStream;

@interface OGCamelDataWrapper : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)dataWrapper;

/**
 * Methods
 */

- (CamelDataWrapper*)castedGObject;

/**
 * Calculates decoded size of the @data_wrapper by saving it to a null-stream
 * and returns how many bytes had been written. It's using
 * camel_data_wrapper_decode_to_stream_sync() internally.
 *
 * @param cancellable a #GCancellable, or %NULL
 * @return how many bytes the @data_wrapper would use when saved,
 *   or -1 on error.
 */
- (gsize)calculateDecodedSizeSync:(OGCancellable*)cancellable;

/**
 * Calculates size of the @data_wrapper by saving it to a null-stream
 * and returns how many bytes had been written. It's using
 * camel_data_wrapper_write_to_stream_sync() internally.
 *
 * @param cancellable a #GCancellable, or %NULL
 * @return how many bytes the @data_wrapper would use when saved,
 *   or -1 on error.
 */
- (gsize)calculateSizeSync:(OGCancellable*)cancellable;

/**
 * Constructs the content of @data_wrapper from @data of length @data_len.
 *
 * @param data data to set
 * @param dataLen length of @data
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromDataSyncWithData:(gconstpointer)data dataLen:(gssize)dataLen cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously constructs the content of @data_wrapper from @input_stream.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_construct_from_input_stream_finish() to get the
 * result of the operation.
 *
 * @param inputStream a #GInputStream
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)constructFromInputStreamWithInputStream:(OGInputStream*)inputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with
 * camel_data_wrapper_construct_from_input_stream().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromInputStreamFinish:(GAsyncResult*)result;

/**
 * Constructs the content of @data_wrapper from @input_stream.
 *
 * @param inputStream a #GInputStream
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromInputStreamSyncWithInputStream:(OGInputStream*)inputStream cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously constructs the content of @data_wrapper from the given
 * @stream.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_construct_from_stream_finish() to get the result
 * of the operation.
 *
 * @param stream an input #CamelStream
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)constructFromStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with
 * camel_data_wrapper_construct_from_stream().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromStreamFinish:(GAsyncResult*)result;

/**
 * Constructs the content of @data_wrapper from the given @stream.
 *
 * @param stream an input #CamelStream
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)constructFromStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously writes the decoded data content to @output_stream.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_decode_to_output_stream_finish() to get the result
 * of the operation.
 *
 * @param outputStream a #GOutputStream
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)decodeToOutputStreamWithOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with
 * camel_data_wrapper_decode_to_output_stream().
 *
 * @param result a #GAsyncResult
 * @return the number of bytes written, or -1 on error
 */
- (gssize)decodeToOutputStreamFinish:(GAsyncResult*)result;

/**
 * Writes the decoded data content to @output_stream.
 * 
 * <note>
 *   <para>
 *     This function may block even if the given output stream does not.
 *     For example, the content may have to be fetched across a network
 *     before it can be written to @output_stream.
 *   </para>
 * </note>
 *
 * @param outputStream a #GOutputStream
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes written, or -1 on error
 */
- (gssize)decodeToOutputStreamSyncWithOutputStream:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously writes the decoded data content to @stream.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_decode_to_stream_finish() to get the result of
 * the operation.
 *
 * @param stream a #CamelStream for decoded data to be written to
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)decodeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_data_wrapper_decode_to_stream().
 *
 * @param result a #GAsyncResult
 * @return the number of bytes written, or -1 on error
 */
- (gssize)decodeToStreamFinish:(GAsyncResult*)result;

/**
 * Writes the decoded data content to @stream.
 * 
 * <note>
 *   <para>
 *     This function may block even if the given output stream does not.
 *     For example, the content may have to be fetched across a network
 *     before it can be written to @stream.
 *   </para>
 * </note>
 *
 * @param stream a #CamelStream for decoded data to be written to
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes written, or -1 on error
 */
- (gssize)decodeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable;

/**
 * Returns the #GByteArray being used to hold the contents of @data_wrapper.
 * 
 * Note, it's up to the caller to use this in a thread-safe manner.
 *
 * @return the #GByteArray for @data_wrapper
 */
- (GByteArray*)byteArray;

/**
 *
 * @return An encoding (#CamelTransferEncoding) of the @data_wrapper
 */
- (CamelTransferEncoding)encoding;

/**
 *
 * @return the MIME type which must be freed by the caller
 */
- (OFString*)mimeType;

/**
 *
 * @return the parsed form of the data wrapper's MIME type
 */
- (CamelContentType*)mimeTypeField;

/**
 *
 * @return whether @data_wrapper is "offline" (data stored
 * remotely) or not. Some optional code paths may choose to not
 * operate on offline data.
 */
- (bool)isOffline;

/**
 * Sets encoding (#CamelTransferEncoding) for the @data_wrapper.
 * It doesn't re-encode the content, if the encoding changes.
 *
 * @param encoding an encoding to set
 */
- (void)setEncoding:(CamelTransferEncoding)encoding;

/**
 * This sets the data wrapper's MIME type.
 * 
 * It might fail, but you won't know. It will allow you to set
 * Content-Type parameters on the data wrapper, which are meaningless.
 * You should not be allowed to change the MIME type of a data wrapper
 * that contains data, or at least, if you do, it should invalidate the
 * data.
 *
 * @param mimeType a MIME type
 */
- (void)setMimeType:(OFString*)mimeType;

/**
 * This sets the data wrapper's MIME type. It adds its own reference
 * to @mime_type, if not %NULL.
 * 
 * It suffers from the same flaws as camel_data_wrapper_set_mime_type().
 *
 * @param mimeType a #CamelContentType
 */
- (void)setMimeTypeField:(CamelContentType*)mimeType;

/**
 * Sets whether the @data_wrapper is "offline". It applies only to this
 * concrete instance. See camel_data_wrapper_is_offline().
 *
 * @param offline whether the @data_wrapper is "offline"
 */
- (void)setOffline:(bool)offline;

/**
 * Sets mime-type filed to be @mime_type and consumes it, aka unlike
 * camel_data_wrapper_set_mime_type_field(), this doesn't add its own
 * reference to @mime_type.
 * 
 * It suffers from the same flaws as camel_data_wrapper_set_mime_type().
 *
 * @param mimeType a #CamelContentType
 */
- (void)takeMimeTypeField:(CamelContentType*)mimeType;

/**
 * Asynchronously writes the content of @data_wrapper to @output_stream in
 * a machine-independent format appropriate for the data.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_write_to_output_stream_finish() to get the result
 * of the operation.
 *
 * @param outputStream a #GOutputStream
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)writeToOutputStreamWithOutputStream:(OGOutputStream*)outputStream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with
 * camel_data_wrapper_write_to_output_stream().
 *
 * @param result a #GAsyncResult
 * @return the number of bytes written, or -1 on error
 */
- (gssize)writeToOutputStreamFinish:(GAsyncResult*)result;

/**
 * Writes the content of @data_wrapper to @output_stream in a
 * machine-independent format appropriate for the data.
 * 
 * <note>
 *   <para>
 *     This function may block even if the given output stream does not.
 *     For example, the content may have to be fetched across a network
 *     before it can be written to @output_stream.
 *   </para>
 * </note>
 *
 * @param outputStream a #GOutputStream
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes written, or -1 on error
 */
- (gssize)writeToOutputStreamSyncWithOutputStream:(OGOutputStream*)outputStream cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously writes the content of @data_wrapper to @stream in a
 * machine-independent format appropriate for the data.  It should be
 * possible to construct an equivalent data wrapper object later by
 * passing this stream to camel_data_wrapper_construct_from_stream().
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_data_wrapper_write_to_stream_finish() to get the result of
 * the operation.
 *
 * @param stream a #CamelStream for writed data to be written to
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)writeToStreamWithStream:(OGCamelStream*)stream ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_data_wrapper_write_to_stream().
 *
 * @param result a #GAsyncResult
 * @return the number of bytes written, or -1 or error
 */
- (gssize)writeToStreamFinish:(GAsyncResult*)result;

/**
 * Writes the content of @data_wrapper to @stream in a machine-independent
 * format appropriate for the data.  It should be possible to construct an
 * equivalent data wrapper object later by passing this stream to
 * camel_data_wrapper_construct_from_stream_sync().
 * 
 * <note>
 *   <para>
 *     This function may block even if the given output stream does not.
 *     For example, the content may have to be fetched across a network
 *     before it can be written to @stream.
 *   </para>
 * </note>
 *
 * @param stream a #CamelStream for output
 * @param cancellable optional #GCancellable object, or %NULL
 * @return the number of bytes written, or -1 on error
 */
- (gssize)writeToStreamSyncWithStream:(OGCamelStream*)stream cancellable:(OGCancellable*)cancellable;

@end