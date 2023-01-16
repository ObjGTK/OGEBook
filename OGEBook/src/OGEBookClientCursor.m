/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientCursor.h"

#import "OGEBookClient.h"
#import <OGEBookContacts/OGEContact.h>

@implementation OGEBookClientCursor

- (EBookClientCursor*)BOOKCLIENTCURSOR
{
	return E_BOOK_CLIENT_CURSOR([self GOBJECT]);
}

- (const gchar* const*)alphabetWithNlabels:(gint*)nlabels underflow:(gint*)underflow inflow:(gint*)inflow overflow:(gint*)overflow
{
	return e_book_client_cursor_get_alphabet([self BOOKCLIENTCURSOR], nlabels, underflow, inflow, overflow);
}

- (gint)contactAlphabeticIndex:(OGEContact*)contact
{
	return e_book_client_cursor_get_contact_alphabetic_index([self BOOKCLIENTCURSOR], [contact CONTACT]);
}

- (gint)position
{
	return e_book_client_cursor_get_position([self BOOKCLIENTCURSOR]);
}

- (gint)total
{
	return e_book_client_cursor_get_total([self BOOKCLIENTCURSOR]);
}

- (OGEBookClient*)refClient
{
	return [[[OGEBookClient alloc] initWithGObject:(GObject*)e_book_client_cursor_ref_client([self BOOKCLIENTCURSOR])] autorelease];
}

- (void)setAlphabeticIndexWithIndex:(gint)index cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_alphabetic_index([self BOOKCLIENTCURSOR], index, cancellable, callback, userData);
}

- (bool)setAlphabeticIndexFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_cursor_set_alphabetic_index_finish([self BOOKCLIENTCURSOR], result, err);
}

- (bool)setAlphabeticIndexSyncWithIndex:(gint)index cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_cursor_set_alphabetic_index_sync([self BOOKCLIENTCURSOR], index, cancellable, err);
}

- (void)setSexpWithSexp:(OFString*)sexp cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_sexp([self BOOKCLIENTCURSOR], [sexp UTF8String], cancellable, callback, userData);
}

- (bool)setSexpFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_cursor_set_sexp_finish([self BOOKCLIENTCURSOR], result, err);
}

- (bool)setSexpSyncWithSexp:(OFString*)sexp cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_cursor_set_sexp_sync([self BOOKCLIENTCURSOR], [sexp UTF8String], cancellable, err);
}

- (void)stepWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_step([self BOOKCLIENTCURSOR], flags, origin, count, cancellable, callback, userData);
}

- (gint)stepFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts err:(GError**)err
{
	return e_book_client_cursor_step_finish([self BOOKCLIENTCURSOR], result, outContacts, err);
}

- (gint)stepSyncWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count outContacts:(GSList**)outContacts cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_cursor_step_sync([self BOOKCLIENTCURSOR], flags, origin, count, outContacts, cancellable, err);
}


@end