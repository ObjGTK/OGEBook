/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookClient.h"

#import "OGEBookClientView.h"
#import <OGEBookContacts/OGEContact.h>
#import "OGEBookClientCursor.h"
#import <OGEDataServer/OGESourceRegistry.h>
#import <OGEDataServer/OGESource.h>

@implementation OGEBookClient

+ (void)connectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_connect([source SOURCE], waitForConnectedSeconds, cancellable, callback, userData);
}

+ (void)connectDirectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_connect_direct([source SOURCE], waitForConnectedSeconds, cancellable, callback, userData);
}

+ (OGEClient*)connectDirectFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGEClient alloc] initWithGObject:(GObject*)e_book_client_connect_direct_finish(result, err)] autorelease];
}

+ (OGEClient*)connectDirectSyncWithRegistry:(OGESourceRegistry*)registry source:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGEClient alloc] initWithGObject:(GObject*)e_book_client_connect_direct_sync([registry SOURCEREGISTRY], [source SOURCE], waitForConnectedSeconds, cancellable, err)] autorelease];
}

+ (OGEClient*)connectFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return [[[OGEClient alloc] initWithGObject:(GObject*)e_book_client_connect_finish(result, err)] autorelease];
}

+ (OGEClient*)connectSyncWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return [[[OGEClient alloc] initWithGObject:(GObject*)e_book_client_connect_sync([source SOURCE], waitForConnectedSeconds, cancellable, err)] autorelease];
}

+ (bool)selfWithRegistry:(OGESourceRegistry*)registry outContact:(EContact**)outContact outClient:(EBookClient**)outClient err:(GError**)err
{
	return e_book_client_get_self([registry SOURCEREGISTRY], outContact, outClient, err);
}

+ (bool)isSelf:(OGEContact*)contact
{
	return e_book_client_is_self([contact CONTACT]);
}

- (instancetype)initWithSource:(OGESource*)source err:(GError**)err
{
	self = [super initWithGObject:(GObject*)e_book_client_new([source SOURCE], err)];

	return self;
}

- (EBookClient*)BOOKCLIENT
{
	return E_BOOK_CLIENT([self GOBJECT]);
}

- (void)addContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_add_contact([self BOOKCLIENT], [contact CONTACT], opflags, cancellable, callback, userData);
}

- (bool)addContactFinishWithResult:(GAsyncResult*)result outAddedUid:(gchar**)outAddedUid err:(GError**)err
{
	return e_book_client_add_contact_finish([self BOOKCLIENT], result, outAddedUid, err);
}

- (bool)addContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags outAddedUid:(gchar**)outAddedUid cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_add_contact_sync([self BOOKCLIENT], [contact CONTACT], opflags, outAddedUid, cancellable, err);
}

- (void)addContactsWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_add_contacts([self BOOKCLIENT], contacts, opflags, cancellable, callback, userData);
}

- (bool)addContactsFinishWithResult:(GAsyncResult*)result outAddedUids:(GSList**)outAddedUids err:(GError**)err
{
	return e_book_client_add_contacts_finish([self BOOKCLIENT], result, outAddedUids, err);
}

- (bool)addContactsSyncWithContacts:(GSList*)contacts opflags:(guint32)opflags outAddedUids:(GSList**)outAddedUids cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_add_contacts_sync([self BOOKCLIENT], contacts, opflags, outAddedUids, cancellable, err);
}

- (void)contactWithUid:(OFString*)uid cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contact([self BOOKCLIENT], [uid UTF8String], cancellable, callback, userData);
}

- (bool)contactFinishWithResult:(GAsyncResult*)result outContact:(EContact**)outContact err:(GError**)err
{
	return e_book_client_get_contact_finish([self BOOKCLIENT], result, outContact, err);
}

- (bool)contactSyncWithUid:(OFString*)uid outContact:(EContact**)outContact cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_get_contact_sync([self BOOKCLIENT], [uid UTF8String], outContact, cancellable, err);
}

- (void)contactsWithSexp:(OFString*)sexp cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contacts([self BOOKCLIENT], [sexp UTF8String], cancellable, callback, userData);
}

- (bool)contactsFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts err:(GError**)err
{
	return e_book_client_get_contacts_finish([self BOOKCLIENT], result, outContacts, err);
}

- (bool)contactsSyncWithSexp:(OFString*)sexp outContacts:(GSList**)outContacts cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_get_contacts_sync([self BOOKCLIENT], [sexp UTF8String], outContacts, cancellable, err);
}

- (void)contactsUidsWithSexp:(OFString*)sexp cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_contacts_uids([self BOOKCLIENT], [sexp UTF8String], cancellable, callback, userData);
}

- (bool)contactsUidsFinishWithResult:(GAsyncResult*)result outContactUids:(GSList**)outContactUids err:(GError**)err
{
	return e_book_client_get_contacts_uids_finish([self BOOKCLIENT], result, outContactUids, err);
}

- (bool)contactsUidsSyncWithSexp:(OFString*)sexp outContactUids:(GSList**)outContactUids cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_get_contacts_uids_sync([self BOOKCLIENT], [sexp UTF8String], outContactUids, cancellable, err);
}

- (void)cursorWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_cursor([self BOOKCLIENT], [sexp UTF8String], sortFields, sortTypes, nfields, cancellable, callback, userData);
}

- (bool)cursorFinishWithResult:(GAsyncResult*)result outCursor:(EBookClientCursor**)outCursor err:(GError**)err
{
	return e_book_client_get_cursor_finish([self BOOKCLIENT], result, outCursor, err);
}

- (bool)cursorSyncWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields outCursor:(EBookClientCursor**)outCursor cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_get_cursor_sync([self BOOKCLIENT], [sexp UTF8String], sortFields, sortTypes, nfields, outCursor, cancellable, err);
}

- (OFString*)locale
{
	return [OFString stringWithUTF8String:e_book_client_get_locale([self BOOKCLIENT])];
}

- (void)viewWithSexp:(OFString*)sexp cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_get_view([self BOOKCLIENT], [sexp UTF8String], cancellable, callback, userData);
}

- (bool)viewFinishWithResult:(GAsyncResult*)result outView:(EBookClientView**)outView err:(GError**)err
{
	return e_book_client_get_view_finish([self BOOKCLIENT], result, outView, err);
}

- (bool)viewSyncWithSexp:(OFString*)sexp outView:(EBookClientView**)outView cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_get_view_sync([self BOOKCLIENT], [sexp UTF8String], outView, cancellable, err);
}

- (void)modifyContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_modify_contact([self BOOKCLIENT], [contact CONTACT], opflags, cancellable, callback, userData);
}

- (bool)modifyContactFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_modify_contact_finish([self BOOKCLIENT], result, err);
}

- (bool)modifyContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_modify_contact_sync([self BOOKCLIENT], [contact CONTACT], opflags, cancellable, err);
}

- (void)modifyContactsWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_modify_contacts([self BOOKCLIENT], contacts, opflags, cancellable, callback, userData);
}

- (bool)modifyContactsFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_modify_contacts_finish([self BOOKCLIENT], result, err);
}

- (bool)modifyContactsSyncWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_modify_contacts_sync([self BOOKCLIENT], contacts, opflags, cancellable, err);
}

- (void)removeContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contact([self BOOKCLIENT], [contact CONTACT], opflags, cancellable, callback, userData);
}

- (void)removeContactByUidWithUid:(OFString*)uid opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contact_by_uid([self BOOKCLIENT], [uid UTF8String], opflags, cancellable, callback, userData);
}

- (bool)removeContactByUidFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_remove_contact_by_uid_finish([self BOOKCLIENT], result, err);
}

- (bool)removeContactByUidSyncWithUid:(OFString*)uid opflags:(guint32)opflags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_remove_contact_by_uid_sync([self BOOKCLIENT], [uid UTF8String], opflags, cancellable, err);
}

- (bool)removeContactFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_remove_contact_finish([self BOOKCLIENT], result, err);
}

- (bool)removeContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_remove_contact_sync([self BOOKCLIENT], [contact CONTACT], opflags, cancellable, err);
}

- (void)removeContactsWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	e_book_client_remove_contacts([self BOOKCLIENT], uids, opflags, cancellable, callback, userData);
}

- (bool)removeContactsFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return e_book_client_remove_contacts_finish([self BOOKCLIENT], result, err);
}

- (bool)removeContactsSyncWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return e_book_client_remove_contacts_sync([self BOOKCLIENT], uids, opflags, cancellable, err);
}

- (bool)setSelfWithContact:(OGEContact*)contact err:(GError**)err
{
	return e_book_client_set_self([self BOOKCLIENT], [contact CONTACT], err);
}


@end