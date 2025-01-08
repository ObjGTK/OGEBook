/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTransport.h"

#import "OGCamelAddress.h"
#import "OGCamelMimeMessage.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelTransport

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_TRANSPORT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelTransport*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelTransport, CamelTransport);
}

- (bool)requestDsn
{
	bool returnValue = (bool)camel_transport_get_request_dsn([self castedGObject]);

	return returnValue;
}

- (void)sendToWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_transport_send_to([self castedGObject], [message castedGObject], [from castedGObject], [recipients castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)sendToFinishWithResult:(GAsyncResult*)result outSentMessageSaved:(gboolean*)outSentMessageSaved
{
	GError* err = NULL;

	bool returnValue = (bool)camel_transport_send_to_finish([self castedGObject], result, outSentMessageSaved, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)sendToSyncWithMessage:(OGCamelMimeMessage*)message from:(OGCamelAddress*)from recipients:(OGCamelAddress*)recipients outSentMessageSaved:(gboolean*)outSentMessageSaved cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)camel_transport_send_to_sync([self castedGObject], [message castedGObject], [from castedGObject], [recipients castedGObject], outSentMessageSaved, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setRequestDsn:(bool)requestDsn
{
	camel_transport_set_request_dsn([self castedGObject], requestDsn);
}


@end