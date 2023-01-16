/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTransport.h"

#import "OGCamelAddress.h"
#import "OGCamelMimeMessage.h"

@implementation OGCamelTransport

- (CamelTransport*)TRANSPORT
{
	return CAMEL_TRANSPORT([self GOBJECT]);
}

- (void)sendToWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_transport_send_to([self TRANSPORT], [message MIMEMESSAGE], [from ADDRESS], [recipients ADDRESS], ioPriority, cancellable, callback, userData);
}

- (bool)sendToFinishWithResult:(GAsyncResult*)result outSentMessageSaved:(gboolean*)outSentMessageSaved err:(GError**)err
{
	return camel_transport_send_to_finish([self TRANSPORT], result, outSentMessageSaved, err);
}

- (bool)sendToSyncWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients outSentMessageSaved:(gboolean*)outSentMessageSaved cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_transport_send_to_sync([self TRANSPORT], [message MIMEMESSAGE], [from ADDRESS], [recipients ADDRESS], outSentMessageSaved, cancellable, err);
}


@end