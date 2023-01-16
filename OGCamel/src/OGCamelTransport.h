/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelService.h"

@class OGCamelAddress;
@class OGCamelMimeMessage;

@interface OGCamelTransport : OGCamelService
{

}


/**
 * Methods
 */

- (CamelTransport*)TRANSPORT;

/**
 * Sends the message asynchronously to the given recipients, regardless of
 * the contents of @message.  If the message contains a "Bcc" header, the
 * transport is responsible for stripping it.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_transport_send_to_finish() to get the result of the operation.
 *
 * @param message a #CamelMimeMessage to send
 * @param from a #CamelAddress to send from
 * @param recipients a #CamelAddress containing all recipients
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)sendToWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_transport_send_to().
 *
 * @param result a #GAsyncResult
 * @param outSentMessageSaved set to %TRUE, if the sent message was also saved
 * @param err
 * @return %TRUE on success, %FALSE on error
 */
- (bool)sendToFinishWithResult:(GAsyncResult*)result outSentMessageSaved:(gboolean*)outSentMessageSaved err:(GError**)err;

/**
 * Sends the message to the given recipients, regardless of the contents
 * of @message.  If the message contains a "Bcc" header, the transport
 * is responsible for stripping it.
 *
 * @param message a #CamelMimeMessage to send
 * @param from a #CamelAddress to send from
 * @param recipients a #CamelAddress containing all recipients
 * @param outSentMessageSaved set to %TRUE, if the sent message was also saved
 * @param cancellable optional #GCancellable object, or %NULL
 * @param err
 * @return %TRUE on success or %FALSE on error
 */
- (bool)sendToSyncWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients outSentMessageSaved:(gboolean*)outSentMessageSaved cancellable:(GCancellable*)cancellable err:(GError**)err;

@end