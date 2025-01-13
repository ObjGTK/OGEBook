/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClientCursor.h"

#import "OGEBookClient.h"
#import <OGEBookContacts/OGEContact.h>
#import <OGio/OGCancellable.h>

@implementation OGEBookClientCursor

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_BOOK_CLIENT_CURSOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (EBookClientCursor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EBookClientCursor, EBookClientCursor);
}

- (const gchar* const*)alphabetWithNlabels:(gint*)nlabels underflow:(gint*)underflow inflow:(gint*)inflow overflow:(gint*)overflow
{
	const gchar* const* returnValue = (const gchar* const*)e_book_client_cursor_get_alphabet([self castedGObject], nlabels, underflow, inflow, overflow);

	return returnValue;
}

- (gint)contactAlphabeticIndexWithContact:(OGEContact*)contact
{
	gint returnValue = (gint)e_book_client_cursor_get_contact_alphabetic_index([self castedGObject], [contact castedGObject]);

	return returnValue;
}

- (gint)position
{
	gint returnValue = (gint)e_book_client_cursor_get_position([self castedGObject]);

	return returnValue;
}

- (gint)total
{
	gint returnValue = (gint)e_book_client_cursor_get_total([self castedGObject]);

	return returnValue;
}

- (OGEBookClient*)refClient
{
	EBookClient* gobjectValue = e_book_client_cursor_ref_client([self castedGObject]);

	OGEBookClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setAlphabeticIndex:(gint)index cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_alphabetic_index([self castedGObject], index, [cancellable castedGObject], callback, userData);
}

- (bool)setAlphabeticIndexFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_cursor_set_alphabetic_index_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)setAlphabeticIndexSync:(gint)index cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_cursor_set_alphabetic_index_sync([self castedGObject], index, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_set_sexp([self castedGObject], [sexp UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)setSexpFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_cursor_set_sexp_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)setSexpSync:(OFString*)sexp cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_cursor_set_sexp_sync([self castedGObject], [sexp UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)stepWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_cursor_step([self castedGObject], flags, origin, count, [cancellable castedGObject], callback, userData);
}

- (gint)stepFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts
{
	GError* err = NULL;

	gint returnValue = (gint)e_book_client_cursor_step_finish([self castedGObject], result, outContacts, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (gint)stepSyncWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count outContacts:(GSList**)outContacts cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	gint returnValue = (gint)e_book_client_cursor_step_sync([self castedGObject], flags, origin, count, outContacts, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end