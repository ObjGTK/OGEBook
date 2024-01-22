/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientCursor.h"

#import "OGEBookClient.h"
#import <OGio/OGCancellable.h>
#import <OGEBookContacts/OGEContact.h>

@implementation OGEBookClientCursor

- (EBookClientCursor*)castedGObject
{
	return E_BOOK_CLIENT_CURSOR([self gObject]);
}

- (const gchar* const*)alphabetWithNlabels:(gint*)nlabels underflow:(gint*)underflow inflow:(gint*)inflow overflow:(gint*)overflow
{
	const gchar* const* returnValue = e_book_client_cursor_get_alphabet([self castedGObject], nlabels, underflow, inflow, overflow);

	return returnValue;
}

- (gint)contactAlphabeticIndex:(OGEContact*)contact
{
	gint returnValue = e_book_client_cursor_get_contact_alphabetic_index([self castedGObject], [contact castedGObject]);

	return returnValue;
}

- (gint)position
{
	gint returnValue = e_book_client_cursor_get_position([self castedGObject]);

	return returnValue;
}

- (gint)total
{
	gint returnValue = e_book_client_cursor_get_total([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)refClient
{
	EBookClient* gobjectValue = E_BOOK_CLIENT(e_book_client_cursor_ref_client([self castedGObject]));

	OGEBookClient* returnValue = [OGEBookClient wrapperFor:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAlphabeticIndexWithIndex:(gint)index cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_alphabetic_index([self castedGObject], index, [cancellable castedGObject], callback, userData);
}

- (bool)setAlphabeticIndexFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_book_client_cursor_set_alphabetic_index_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setAlphabeticIndexSyncWithIndex:(gint)index cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_book_client_cursor_set_alphabetic_index_sync([self castedGObject], index, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setSexpWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_sexp([self castedGObject], [sexp UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)setSexpFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = e_book_client_cursor_set_sexp_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)setSexpSyncWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = e_book_client_cursor_set_sexp_sync([self castedGObject], [sexp UTF8String], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)stepWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_step([self castedGObject], flags, origin, count, [cancellable castedGObject], callback, userData);
}

- (gint)stepFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts
{
	GError* err = NULL;

	gint returnValue = e_book_client_cursor_step_finish([self castedGObject], result, outContacts, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (gint)stepSyncWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count outContacts:(GSList**)outContacts cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = e_book_client_cursor_step_sync([self castedGObject], flags, origin, count, outContacts, [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end