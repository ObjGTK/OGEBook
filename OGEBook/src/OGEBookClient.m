/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClient.h"

#import "OGEBookClientCursor.h"
#import "OGEBookClientView.h"
#import <OGEBookContacts/OGEContact.h>
#import <OGEDataServer/OGESource.h>
#import <OGEDataServer/OGESourceRegistry.h>
#import <OGio/OGCancellable.h>

@implementation OGEBookClient

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_BOOK_CLIENT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (void)connectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_connect([source castedGObject], waitForConnectedSeconds, [cancellable castedGObject], callback, userData);
}

+ (void)connectDirectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_connect_direct([source castedGObject], waitForConnectedSeconds, [cancellable castedGObject], callback, userData);
}

+ (OGEClient*)connectDirectFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	EClient* gobjectValue = e_book_client_connect_direct_finish(result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGEClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (OGEClient*)connectDirectSyncWithRegistry:(OGESourceRegistry*)registry source:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	EClient* gobjectValue = e_book_client_connect_direct_sync([registry castedGObject], [source castedGObject], waitForConnectedSeconds, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGEClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (OGEClient*)connectFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	EClient* gobjectValue = e_book_client_connect_finish(result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGEClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (OGEClient*)connectSyncWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	EClient* gobjectValue = e_book_client_connect_sync([source castedGObject], waitForConnectedSeconds, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGEClient* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (bool)selfWithRegistry:(OGESourceRegistry*)registry outContact:(EContact**)outContact outClient:(EBookClient**)outClient
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_self([registry castedGObject], outContact, outClient, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

+ (bool)isSelfWithContact:(OGEContact*)contact
{
	bool returnValue = (bool)e_book_client_is_self([contact castedGObject]);

	return returnValue;
}

+ (instancetype)bookClientWithSource:(OGESource*)source
{
	GError* err = NULL;

	EBookClient* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(e_book_client_new([source castedGObject], &err), EBookClient, EBookClient);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGEBookClient* wrapperObject;
	@try {
		wrapperObject = [[OGEBookClient alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (EBookClient*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EBookClient, EBookClient);
}

- (void)addContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_add_contact([self castedGObject], [contact castedGObject], opflags, [cancellable castedGObject], callback, userData);
}

- (bool)addContactFinishWithResult:(GAsyncResult*)result outAddedUid:(gchar**)outAddedUid
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_add_contact_finish([self castedGObject], result, outAddedUid, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addContactSync:(OGEContact*)contact opflags:(guint32)opflags outAddedUid:(gchar**)outAddedUid cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_add_contact_sync([self castedGObject], [contact castedGObject], opflags, outAddedUid, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)addContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_add_contacts([self castedGObject], contacts, opflags, [cancellable castedGObject], callback, userData);
}

- (bool)addContactsFinishWithResult:(GAsyncResult*)result outAddedUids:(GSList**)outAddedUids
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_add_contacts_finish([self castedGObject], result, outAddedUids, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)addContactsSync:(GSList*)contacts opflags:(guint32)opflags outAddedUids:(GSList**)outAddedUids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_add_contacts_sync([self castedGObject], contacts, opflags, outAddedUids, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)containsEmailWithEmailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_contains_email([self castedGObject], [emailAddress UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)containsEmailFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_contains_email_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)containsEmailSyncWithEmailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_contains_email_sync([self castedGObject], [emailAddress UTF8String], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)contactWithUid:(OFString*)uid cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contact([self castedGObject], [uid UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)contactFinishWithResult:(GAsyncResult*)result outContact:(EContact**)outContact
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contact_finish([self castedGObject], result, outContact, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)contactSyncWithUid:(OFString*)uid outContact:(EContact**)outContact cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contact_sync([self castedGObject], [uid UTF8String], outContact, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)contactsWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contacts([self castedGObject], [sexp UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)contactsFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contacts_finish([self castedGObject], result, outContacts, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)contactsSyncWithSexp:(OFString*)sexp outContacts:(GSList**)outContacts cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contacts_sync([self castedGObject], [sexp UTF8String], outContacts, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)contactsUidsWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contacts_uids([self castedGObject], [sexp UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)contactsUidsFinishWithResult:(GAsyncResult*)result outContactUids:(GSList**)outContactUids
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contacts_uids_finish([self castedGObject], result, outContactUids, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)contactsUidsSyncWithSexp:(OFString*)sexp outContactUids:(GSList**)outContactUids cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_contacts_uids_sync([self castedGObject], [sexp UTF8String], outContactUids, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)cursorWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_cursor([self castedGObject], [sexp UTF8String], sortFields, sortTypes, nfields, [cancellable castedGObject], callback, userData);
}

- (bool)cursorFinishWithResult:(GAsyncResult*)result outCursor:(EBookClientCursor**)outCursor
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_cursor_finish([self castedGObject], result, outCursor, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)cursorSyncWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields outCursor:(EBookClientCursor**)outCursor cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_cursor_sync([self castedGObject], [sexp UTF8String], sortFields, sortTypes, nfields, outCursor, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)locale
{
	const gchar* gobjectValue = e_book_client_get_locale([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)viewWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_view([self castedGObject], [sexp UTF8String], [cancellable castedGObject], callback, userData);
}

- (bool)viewFinishWithResult:(GAsyncResult*)result outView:(EBookClientView**)outView
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_view_finish([self castedGObject], result, outView, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)viewSyncWithSexp:(OFString*)sexp outView:(EBookClientView**)outView cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_get_view_sync([self castedGObject], [sexp UTF8String], outView, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)modifyContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_modify_contact([self castedGObject], [contact castedGObject], opflags, [cancellable castedGObject], callback, userData);
}

- (bool)modifyContactFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_modify_contact_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)modifyContactSync:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_modify_contact_sync([self castedGObject], [contact castedGObject], opflags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)modifyContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_modify_contacts([self castedGObject], contacts, opflags, [cancellable castedGObject], callback, userData);
}

- (bool)modifyContactsFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_modify_contacts_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)modifyContactsSync:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_modify_contacts_sync([self castedGObject], contacts, opflags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)removeContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contact([self castedGObject], [contact castedGObject], opflags, [cancellable castedGObject], callback, userData);
}

- (void)removeContactByUid:(OFString*)uid opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contact_by_uid([self castedGObject], [uid UTF8String], opflags, [cancellable castedGObject], callback, userData);
}

- (bool)removeContactByUidFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contact_by_uid_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeContactByUidSync:(OFString*)uid opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contact_by_uid_sync([self castedGObject], [uid UTF8String], opflags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeContactFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contact_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeContactSync:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contact_sync([self castedGObject], [contact castedGObject], opflags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)removeContactsWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contacts([self castedGObject], uids, opflags, [cancellable castedGObject], callback, userData);
}

- (bool)removeContactsFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contacts_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)removeContactsSyncWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_remove_contacts_sync([self castedGObject], uids, opflags, [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)setSelfWithContact:(OGEContact*)contact
{
	GError* err = NULL;

	bool returnValue = (bool)e_book_client_set_self([self castedGObject], [contact castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end