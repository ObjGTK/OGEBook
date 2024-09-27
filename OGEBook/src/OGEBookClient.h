/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook/libebook.h>

#import <OGEDataServer/OGEClient.h>

@class OGESource;
@class OGEBookClientCursor;
@class OGESourceRegistry;
@class OGCancellable;
@class OGEBookClientView;
@class OGEContact;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEBookClient : OGEClient
{

}

/**
 * Functions
 */

/**
 * Asynchronously creates a new #EBookClient for @source.
 * 
 * The @wait_for_connected_seconds argument had been added since 3.16,
 * to let the caller decide how long to wait for the backend to fully
 * connect to its (possibly remote) data store. This is required due
 * to a change in the authentication process, which is fully asynchronous
 * and done on the client side, while not every client is supposed to
 * response to authentication requests. In case the backend will not connect
 * within the set interval, then it is opened in an offline mode. A special
 * value -1 can be used to not wait for the connected state at all.
 * 
 * Unlike with e_book_client_new(), there is no need to call e_client_open()
 * after obtaining the #EBookClient.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_book_client_connect_finish() to get the result of the operation.
 *
 * @param source an #ESource
 * @param waitForConnectedSeconds timeout, in seconds, to wait for the backend to be fully connected
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
+ (void)connectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Like e_book_client_connect(), except creates the book client for
 * direct read access to the underlying addressbook.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_book_client_connect_direct_finish() to get the result of the operation.
 *
 * @param source an #ESource
 * @param waitForConnectedSeconds timeout, in seconds, to wait for the backend to be fully connected
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
+ (void)connectDirectWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with e_book_client_connect_direct().
 * If an error occurs in connecting to the D-Bus service, the function sets
 * @error and returns %NULL.
 * 
 * For error handling convenience, any error message returned by this
 * function will have a descriptive prefix that includes the display
 * name of the #ESource passed to e_book_client_connect_direct().
 *
 * @param result a #GAsyncResult
 * @return a new #EBookClient, or %NULL on error
 */
+ (OGEClient*)connectDirectFinish:(GAsyncResult*)result;

/**
 * Like e_book_client_connect_sync(), except creates the book client for
 * direct read access to the underlying addressbook.
 *
 * @param registry an #ESourceRegistry
 * @param source an #ESource
 * @param waitForConnectedSeconds timeout, in seconds, to wait for the backend to be fully connected
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a new but unopened #EBookClient or %NULL on error.
 */
+ (OGEClient*)connectDirectSyncWithRegistry:(OGESourceRegistry*)registry source:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable;

/**
 * Finishes the operation started with e_book_client_connect().  If an
 * error occurs in connecting to the D-Bus service, the function sets
 * @error and returns %NULL.
 * 
 * For error handling convenience, any error message returned by this
 * function will have a descriptive prefix that includes the display
 * name of the #ESource passed to e_book_client_connect().
 *
 * @param result a #GAsyncResult
 * @return a new #EBookClient,
 * or %NULL on error
 */
+ (OGEClient*)connectFinish:(GAsyncResult*)result;

/**
 * Creates a new #EBookClient for @source.  If an error occurs, the function
 * will set @error and return %FALSE.
 * 
 * Unlike with e_book_client_new(), there is no need to call
 * e_client_open_sync() after obtaining the #EBookClient.
 * 
 * The @wait_for_connected_seconds argument had been added since 3.16,
 * to let the caller decide how long to wait for the backend to fully
 * connect to its (possibly remote) data store. This is required due
 * to a change in the authentication process, which is fully asynchronous
 * and done on the client side, while not every client is supposed to
 * response to authentication requests. In case the backend will not connect
 * within the set interval, then it is opened in an offline mode. A special
 * value -1 can be used to not wait for the connected state at all.
 * 
 * For error handling convenience, any error message returned by this
 * function will have a descriptive prefix that includes the display
 * name of @source.
 *
 * @param source an #ESource
 * @param waitForConnectedSeconds timeout, in seconds, to wait for the backend to be fully connected
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a new #EBookClient,
 *    or %NULL on error
 */
+ (OGEClient*)connectSyncWithSource:(OGESource*)source waitForConnectedSeconds:(guint32)waitForConnectedSeconds cancellable:(OGCancellable*)cancellable;

/**
 * Get the #EContact referring to the user of the address book
 * and set it in @out_contact and @out_client.
 *
 * @param registry an #ESourceRegistry
 * @param outContact an #EContact pointer to set
 * @param outClient an #EBookClient pointer to set
 * @return %TRUE if successful, otherwise %FALSE.
 */
+ (bool)selfWithRegistry:(OGESourceRegistry*)registry outContact:(EContact**)outContact outClient:(EBookClient**)outClient;

/**
 * Check if @contact is the user of the address book.
 *
 * @param contact an #EContact
 * @return %TRUE if @contact is the user, %FALSE otherwise.
 */
+ (bool)isSelf:(OGEContact*)contact;

/**
 * Constructors
 */
- (instancetype)init:(OGESource*)source;

/**
 * Methods
 */

- (EBookClient*)castedGObject;

/**
 * Adds @contact to @client.
 * The call is finished by e_book_client_add_contact_finish()
 * from the @callback.
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)addContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_add_contact() and
 * sets @out_added_uid to a UID of a newly added contact.
 * This string should be freed with g_free().
 * 
 * Note: This is not modifying original #EContact.
 *
 * @param result a #GAsyncResult
 * @param outAddedUid UID of a newly added contact; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)addContactFinishWithResult:(GAsyncResult*)result outAddedUid:(gchar**)outAddedUid;

/**
 * Adds @contact to @client and
 * sets @out_added_uid to a UID of a newly added contact.
 * This string should be freed with g_free().
 * 
 * Note: This is not modifying original @contact, thus if it's needed,
 * then use e_contact_set (contact, E_CONTACT_UID, new_uid).
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param outAddedUid UID of a newly added contact; can be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)addContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags outAddedUid:(gchar**)outAddedUid cancellable:(OGCancellable*)cancellable;

/**
 * Adds @contacts to @client.
 * The call is finished by e_book_client_add_contacts_finish()
 * from the @callback.
 *
 * @param contacts a #GSList of #EContact objects to add
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)addContactsWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_add_contacts() and
 * sets @out_added_uids to the UIDs of newly added contacts if successful.
 * This #GSList should be freed with e_client_util_free_string_slist().
 * 
 * If any of the contacts cannot be inserted, all of the insertions will be
 * reverted and this method will return %FALSE.
 * 
 * Note: This is not modifying original #EContact objects.
 *
 * @param result a #GAsyncResult
 * @param outAddedUids UIDs of
 *                  newly added contacts; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)addContactsFinishWithResult:(GAsyncResult*)result outAddedUids:(GSList**)outAddedUids;

/**
 * Adds @contacts to @client and
 * sets @out_added_uids to the UIDs of newly added contacts if successful.
 * This #GSList should be freed with e_client_util_free_string_slist().
 * 
 * If any of the contacts cannot be inserted, all of the insertions will be
 * reverted and this method will return %FALSE.
 * 
 * Note: This is not modifying original @contacts, thus if it's needed,
 * then use e_contact_set (contact, E_CONTACT_UID, new_uid).
 *
 * @param contacts a #GSList of #EContact objects to add
 * @param opflags bit-or of #EBookOperationFlags
 * @param outAddedUids UIDs of newly
 *                  added contacts; can be %NULL
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)addContactsSyncWithContacts:(GSList*)contacts opflags:(guint32)opflags outAddedUids:(GSList**)outAddedUids cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously checks whether contains an @email_address. When the @email_address
 * contains multiple addresses, then returns %TRUE when at least one
 * address exists in the address book.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call e_book_client_contains_email_finish() to get the result of the
 * operation.
 *
 * @param emailAddress an email address
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)containsEmailWithEmailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_contains_email().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)containsEmailFinish:(GAsyncResult*)result;

/**
 *
 * @param emailAddress
 * @param cancellable
 * @return
 */
- (bool)containsEmailSyncWithEmailAddress:(OFString*)emailAddress cancellable:(OGCancellable*)cancellable;

/**
 * Receive #EContact from the @client for the given @uid.
 * The call is finished by e_book_client_get_contact_finish()
 * from the @callback.
 *
 * @param uid a unique string ID specifying the contact
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)contactWithUid:(OFString*)uid cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_get_contact().
 * If successful, then the @out_contact is set to newly allocated
 * #EContact, which should be freed with g_object_unref().
 *
 * @param result a #GAsyncResult
 * @param outContact an #EContact for previously given uid
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactFinishWithResult:(GAsyncResult*)result outContact:(EContact**)outContact;

/**
 * Receive #EContact from the @client for the gived @uid.
 * If successful, then the @out_contact is set to newly allocated
 * #EContact, which should be freed with g_object_unref().
 *
 * @param uid a unique string ID specifying the contact
 * @param outContact an #EContact for given @uid
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactSyncWithUid:(OFString*)uid outContact:(EContact**)outContact cancellable:(OGCancellable*)cancellable;

/**
 * Query @client with @sexp, receiving a list of contacts which
 * matched. The call is finished by e_book_client_get_contacts_finish()
 * from the @callback.
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)contactsWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_get_contacts().
 * If successful, then the @out_contacts is set to newly allocated list of
 * #EContact(s), which should be freed with e_client_util_free_object_slist().
 *
 * @param result a #GAsyncResult
 * @param outContacts a #GSList
 *                of matched #EContact(s)
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactsFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts;

/**
 * Query @client with @sexp, receiving a list of contacts which matched.
 * If successful, then the @out_contacts is set to newly allocated #GSList of
 * #EContact(s), which should be freed with e_client_util_free_object_slist().
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param outContacts a #GSList of matched
 *                #EContact(s)
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactsSyncWithSexp:(OFString*)sexp outContacts:(GSList**)outContacts cancellable:(OGCancellable*)cancellable;

/**
 * Query @client with @sexp, receiving a list of contacts UIDs which
 * matched. The call is finished by e_book_client_get_contacts_uids_finish()
 * from the @callback.
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)contactsUidsWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_get_contacts_uids().
 * If successful, then the @out_contact_uids is set to newly allocated list
 * of UID strings, which should be freed with e_client_util_free_string_slist().
 *
 * @param result a #GAsyncResult
 * @param outContactUids a #GSList of matched
 *                    contact UIDs stored as strings
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactsUidsFinishWithResult:(GAsyncResult*)result outContactUids:(GSList**)outContactUids;

/**
 * Query @client with @sexp, receiving a list of contacts UIDs which matched.
 * If successful, then the @out_contact_uids is set to newly allocated list
 * of UID strings, which should be freed with e_client_util_free_string_slist().
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param outContactUids a #GSList of matched
 *                    contacts UIDs stored as strings
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)contactsUidsSyncWithSexp:(OFString*)sexp outContactUids:(GSList**)outContactUids cancellable:(OGCancellable*)cancellable;

/**
 * Create an #EBookClientCursor.
 * The call is finished by e_book_client_get_cursor_finish()
 * from the @callback.
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param sortFields an array of #EContactFields to sort the cursor with
 * @param sortTypes an array of #EBookCursorSortTypes to complement @sort_fields
 * @param nfields the length of the input @sort_fields and @sort_types arrays
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)cursorWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_get_cursor().
 * If successful, then the @out_cursor is set to newly create
 * #EBookClientCursor, the cursor should be freed with g_object_unref()
 * when no longer needed.
 *
 * @param result a #GAsyncResult
 * @param outCursor return location for an #EBookClientCursor
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)cursorFinishWithResult:(GAsyncResult*)result outCursor:(EBookClientCursor**)outCursor;

/**
 * Create an #EBookClientCursor. If successful, then the @out_cursor is set
 * to newly allocated #EBookClientCursor, the cursor should be freed with g_object_unref()
 * when no longer needed.
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param sortFields an array of #EContactFields to sort the cursor with
 * @param sortTypes an array of #EBookCursorSortTypes to complement @sort_fields
 * @param nfields the length of the input @sort_fields and @sort_types arrays
 * @param outCursor return location for an #EBookClientCursor
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)cursorSyncWithSexp:(OFString*)sexp sortFields:(const EContactField*)sortFields sortTypes:(const EBookCursorSortType*)sortTypes nfields:(guint)nfields outCursor:(EBookClientCursor**)outCursor cancellable:(OGCancellable*)cancellable;

/**
 * Reports the locale in use for @client. The addressbook might sort contacts
 * in different orders, or store and compare phone numbers in different ways
 * depending on the currently set locale.
 * 
 * Locales can change dynamically if systemd decides to change the locale, so
 * it's important to listen for notifications on the #EBookClient:locale property
 * if you depend on sorted result lists. Ordered results should be reloaded
 * after a locale change is detected.
 *
 * @return The currently set locale for @client
 */
- (OFString*)locale;

/**
 * Query @client with @sexp, creating an #EBookClientView.
 * The call is finished by e_book_client_get_view_finish()
 * from the @callback.
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)viewWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_get_view().
 * If successful, then the @out_view is set to newly allocated
 * #EBookClientView, which should be freed with g_object_unref().
 *
 * @param result a #GAsyncResult
 * @param outView an #EBookClientView
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)viewFinishWithResult:(GAsyncResult*)result outView:(EBookClientView**)outView;

/**
 * Query @client with @sexp, creating an #EBookClientView.
 * If successful, then the @out_view is set to newly allocated
 * #EBookClientView, which should be freed with g_object_unref().
 * 
 * Note: @sexp can be obtained through #EBookQuery, by converting it
 * to a string with e_book_query_to_string().
 *
 * @param sexp an S-expression representing the query
 * @param outView an #EBookClientView
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)viewSyncWithSexp:(OFString*)sexp outView:(EBookClientView**)outView cancellable:(OGCancellable*)cancellable;

/**
 * Applies the changes made to @contact to the stored version in @client.
 * The call is finished by e_book_client_modify_contact_finish()
 * from the @callback.
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)modifyContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_modify_contact().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)modifyContactFinish:(GAsyncResult*)result;

/**
 * Applies the changes made to @contact to the stored version in @client.
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)modifyContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable;

/**
 * Applies the changes made to @contacts to the stored versions in @client.
 * The call is finished by e_book_client_modify_contacts_finish()
 * from the @callback.
 *
 * @param contacts a #GSList of #EContact objects
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)modifyContactsWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_modify_contacts().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)modifyContactsFinish:(GAsyncResult*)result;

/**
 * Applies the changes made to @contacts to the stored versions in @client.
 *
 * @param contacts a #GSList of #EContact objects
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)modifyContactsSyncWithContacts:(GSList*)contacts opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable;

/**
 * Removes @contact from the @client.
 * The call is finished by e_book_client_remove_contact_finish()
 * from the @callback.
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)removeContactWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Removes contact with @uid from the @client.
 * The call is finished by e_book_client_remove_contact_by_uid_finish()
 * from the @callback.
 *
 * @param uid a UID of a contact to remove
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)removeContactByUidWithUid:(OFString*)uid opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_remove_contact_by_uid().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactByUidFinish:(GAsyncResult*)result;

/**
 * Removes contact with @uid from the @client.
 *
 * @param uid a UID of a contact to remove
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactByUidSyncWithUid:(OFString*)uid opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable;

/**
 * Finishes previous call of e_book_client_remove_contact().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactFinish:(GAsyncResult*)result;

/**
 * Removes @contact from the @client.
 *
 * @param contact an #EContact
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactSyncWithContact:(OGEContact*)contact opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable;

/**
 * Removes the contacts with uids from the list @uids from @client.  This is
 * always more efficient than calling e_book_client_remove_contact() if you
 * have more than one uid to remove, as some backends can implement it
 * as a batch request.
 * The call is finished by e_book_client_remove_contacts_finish()
 * from the @callback.
 *
 * @param uids a #GSList of UIDs to remove
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)removeContactsWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_remove_contacts().
 *
 * @param result a #GAsyncResult
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactsFinish:(GAsyncResult*)result;

/**
 * Removes the contacts with uids from the list @uids from @client.  This is
 * always more efficient than calling e_book_client_remove_contact() if you
 * have more than one uid to remove, as some backends can implement it
 * as a batch request.
 *
 * @param uids a #GSList of UIDs to remove
 * @param opflags bit-or of #EBookOperationFlags
 * @param cancellable a #GCancellable; can be %NULL
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)removeContactsSyncWithUids:(const GSList*)uids opflags:(guint32)opflags cancellable:(OGCancellable*)cancellable;

/**
 * Specify that @contact residing in @client is the #EContact that
 * refers to the user of the address book.
 *
 * @param contact an #EContact
 * @return %TRUE if successful, %FALSE otherwise.
 */
- (bool)setSelf:(OGEContact*)contact;

@end