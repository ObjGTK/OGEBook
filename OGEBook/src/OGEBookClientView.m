/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientView.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGDBusConnection.h>
#import "OGEBookClient.h"

@implementation OGEBookClientView

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

	bool returnValue = e_book_client_view_dup_contacts_finish([self castedGObject], result, outRangeStart, outContacts, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (EBookIndices*)dupIndices
{
	EBookIndices* returnValue = e_book_client_view_dup_indices([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)client
{
	EBookClient* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_book_client_view_get_client([self castedGObject]), EBookClient, EBookClient);

	OGEBookClient* returnValue = [OGEBookClient withGObject:gobjectValue];
	return returnValue;
}

- (OGDBusConnection*)connection
{
	GDBusConnection* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_book_client_view_get_connection([self castedGObject]), GDBusConnection, GDBusConnection);

	OGDBusConnection* returnValue = [OGDBusConnection withGObject:gobjectValue];
	return returnValue;
}

- (gsize)id
{
	gsize returnValue = e_book_client_view_get_id([self castedGObject]);

	return returnValue;
}

- (guint)ntotal
{
	guint returnValue = e_book_client_view_get_n_total([self castedGObject]);

	return returnValue;
}

- (OFString*)objectPath
{
	const gchar* gobjectValue = e_book_client_view_get_object_path([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OGEBookClient*)refClient
{
	EBookClient* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_book_client_view_ref_client([self castedGObject]), EBookClient, EBookClient);

	OGEBookClient* returnValue = [OGEBookClient withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setFieldsOfInterest:(const GSList*)fieldsOfInterest
{
	GError* err = NULL;

	e_book_client_view_set_fields_of_interest([self castedGObject], fieldsOfInterest, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)setFlags:(EBookClientViewFlags)flags
{
	GError* err = NULL;

	e_book_client_view_set_flags([self castedGObject], flags, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (bool)setSortFieldsSyncWithFields:(const EBookClientViewSortFields*)fields cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_book_client_view_set_sort_fields_sync([self castedGObject], fields, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)start
{
	GError* err = NULL;

	e_book_client_view_start([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)stop
{
	GError* err = NULL;

	e_book_client_view_stop([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}


@end