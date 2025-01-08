/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientView.h"

#import "OGEBookClient.h"
#import <OGio/OGCancellable.h>
#import <OGio/OGDBusConnection.h>

@implementation OGEBookClientView

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_BOOK_CLIENT_VIEW;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (EBookClientView*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EBookClientView, EBookClientView);
}

- (void)dupContactsWithRangeStart:(guint)rangeStart rangeLength:(guint)rangeLength cancellable:(OGCancellable*)cancellable cb:(GAsyncReadyCallback)cb userData:(gpointer)userData
{
	e_book_client_view_dup_contacts([self castedGObject], rangeStart, rangeLength, [cancellable castedGObject], cb, userData);
}

- (bool)dupContactsFinishWithResult:(GAsyncResult*)result outRangeStart:(guint*)outRangeStart outContacts:(GPtrArray**)outContacts
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_view_dup_contacts_finish([self castedGObject], result, outRangeStart, outContacts, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (EBookIndices*)dupIndices
{
	EBookIndices* returnValue = (EBookIndices*)e_book_client_view_dup_indices([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)client
{
	EBookClient* gobjectValue = e_book_client_view_get_client([self castedGObject]);

	OGEBookClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGDBusConnection*)connection
{
	GDBusConnection* gobjectValue = e_book_client_view_get_connection([self castedGObject]);

	OGDBusConnection* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (gsize)id
{
	gsize returnValue = (gsize)e_book_client_view_get_id([self castedGObject]);

	return returnValue;
}

- (guint)ntotal
{
	guint returnValue = (guint)e_book_client_view_get_n_total([self castedGObject]);

	return returnValue;
}

- (OFString*)objectPath
{
	const gchar* gobjectValue = e_book_client_view_get_object_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)isRunning
{
	bool returnValue = (bool)e_book_client_view_is_running([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)refClient
{
	EBookClient* gobjectValue = e_book_client_view_ref_client([self castedGObject]);

	OGEBookClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setFieldsOfInterest:(const GSList*)fieldsOfInterest
{
	GError* err = NULL;

	e_book_client_view_set_fields_of_interest([self castedGObject], fieldsOfInterest, &err);

	[OGErrorException throwForError:err];

}

- (void)setFlags:(EBookClientViewFlags)flags
{
	GError* err = NULL;

	e_book_client_view_set_flags([self castedGObject], flags, &err);

	[OGErrorException throwForError:err];

}

- (bool)setSortFieldsSyncWithFields:(const EBookClientViewSortFields*)fields cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_view_set_sort_fields_sync([self castedGObject], fields, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)start
{
	GError* err = NULL;

	e_book_client_view_start([self castedGObject], &err);

	[OGErrorException throwForError:err];

}

- (void)stop
{
	GError* err = NULL;

	e_book_client_view_stop([self castedGObject], &err);

	[OGErrorException throwForError:err];

}


@end