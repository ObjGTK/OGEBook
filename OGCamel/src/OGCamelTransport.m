/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTransport.h"

#import <OGio/OGCancellable.h>
#import "OGCamelMimeMessage.h"
#import "OGCamelAddress.h"

@implementation OGCamelTransport

- (CamelTransport*)castedGObject
{
	return CAMEL_TRANSPORT([self gObject]);
}

- (bool)requestDsn
{
	bool returnValue = camel_transport_get_request_dsn([self castedGObject]);

	return returnValue;
}

- (void)sendToWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_transport_send_to([self castedGObject], [message castedGObject], [from castedGObject], [recipients castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)sendToFinishWithResult:(GAsyncResult*)result outSentMessageSaved:(gboolean*)outSentMessageSaved
{
	GError* err = NULL;

	bool returnValue = camel_transport_send_to_finish([self castedGObject], result, outSentMessageSaved, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)sendToSyncWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients outSentMessageSaved:(gboolean*)outSentMessageSaved cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_transport_send_to_sync([self castedGObject], [message castedGObject], [from castedGObject], [recipients castedGObject], outSentMessageSaved, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setRequestDsn:(bool)requestDsn
{
	camel_transport_set_request_dsn([self castedGObject], requestDsn);
}


@end