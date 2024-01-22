/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook/libebook.h>

#import <OGObject/OGObject.h>

@class OGEBookClient;
@class OGDBusConnection;
@class OGCancellable;

/**
 * Contains only private data the should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEBookClientView : OGObject
{

}


/**
 * Methods
 */

- (EBookClientView*)castedGObject;

/**
 * Asynchronously reads @range_length contacts from index @range_start.
 * When there are asked more than e_book_client_view_get_n_total()
 * contacts only those up to the total number of contacts are read.
 * Asking for out of range contacts results in an error.
 * 
 * Finish the call by e_book_client_view_dup_contacts_finish() from the @cb.
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @param rangeStart 0-based range start to retrieve the contacts for
 * @param rangeLength how many contacts to retrieve
 * @param cancellable optional #GCancellable object, or %NULL
 * @param cb a callback to call when the contacts are received
 * @param userData user data for @cb
 */
- (void)dupContactsWithRangeStart:(guint)rangeStart rangeLength:(guint)rangeLength cancellable:(OGCancellable*)cancellable cb:(GAsyncReadyCallback)cb userData:(gpointer)userData;

/**
 * Finishes previous call of e_book_client_view_dup_contacts();
 * see it for further information.
 * 
 * Free the returned #GPtrArray with g_ptr_array_unref(), when
 * no longer needed.
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @param result an asynchronous call result
 * @param outRangeStart output location where to store original range start, or %NULL
 * @param outContacts output location where to store array of the read contacts
 * @return whether succeeded; if not, the @error is set
 */
- (bool)dupContactsFinishWithResult:(GAsyncResult*)result outRangeStart:(guint*)outRangeStart outContacts:(GPtrArray**)outContacts;

/**
 * Returns a list of #EBookIndices holding indices of the contacts
 * in the view. These are received from the first sort field set by
 * e_book_client_view_set_sort_fields_sync(). The last item of the returned
 * array is the one with chr member being %NULL.
 * 
 * Free the returned array with e_book_indices_free(), when no longer needed.
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @return list of indices for the view
 */
- (EBookIndices*)dupIndices;

/**
 * Returns the #EBookClientView:client associated with @client_view.
 *
 * @return an #EBookClient
 */
- (OGEBookClient*)client;

/**
 * Returns the #GDBusConnection used to create the D-Bus proxy.
 *
 * @return the #GDBusConnection
 */
- (OGDBusConnection*)connection;

/**
 * Returns an identifier of the @self. It does not change
 * for the whole life time of the @self.
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @return an identifier of the view
 */
- (gsize)id;

/**
 * Returns how many contacts are available in the view.
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @return how many contacts are available in the view
 */
- (guint)ntotal;

/**
 * Returns the object path used to create the D-Bus proxy.
 *
 * @return the object path
 */
- (OFString*)objectPath;

/**
 * Returns the #EBookClientView:client associated with @client_view.
 * 
 * The returned #EBookClient is referenced for thread-safety.  Unreference
 * the #EBookClient with g_object_unref() when finished with it.
 *
 * @return an #EBookClient
 */
- (OGEBookClient*)refClient;

/**
 * Client can instruct server to which fields it is interested in only, thus
 * the server can return less data over the wire. The server can still return
 * complete objects, this is just a hint to it that the listed fields will
 * be used only. The UID field is returned always. Initial views has no fields
 * of interest and using %NULL for @fields_of_interest will unset any previous
 * changes.
 * 
 * Some backends can use summary information of its cache to create artifical
 * objects, which will omit stored object parsing. If this cannot be done then
 * it will simply return object as is stored in the cache.
 *
 * @param fieldsOfInterest List of field names in which
 *                      the client is interested
 */
- (void)setFieldsOfInterest:(const GSList*)fieldsOfInterest;

/**
 * Sets the @flags which control the behaviour of @client_view.
 *
 * @param flags the #EBookClientViewFlags for @client_view
 */
- (void)setFlags:(EBookClientViewFlags)flags;

/**
 * Sets @fields to sort the view by. The default is to sort by the file-as
 * field in ascending order. Not every field can be used for sorting,
 * usually available fields are %E_CONTACT_FILE_AS,
 * %E_CONTACT_GIVEN_NAME and %E_CONTACT_FAMILY_NAME.
 * 
 * The array is terminated by an item with an %E_CONTACT_FIELD_LAST field.
 * 
 * The first sort field is used to populate indices, as returned
 * by e_book_client_view_dup_indices().
 * 
 * Note: This function can be used only with @E_BOOK_CLIENT_VIEW_FLAGS_MANUAL_QUERY.
 *
 * @param fields an array of #EBookClientViewSortFields, terminated by item with %E_CONTACT_FIELD_LAST field
 * @param cancellable optional #GCancellable object, or %NULL
 * @return whether succeeded
 */
- (bool)setSortFieldsSyncWithFields:(const EBookClientViewSortFields*)fields cancellable:(OGCancellable*)cancellable;

/**
 * Tells @client_view to start processing events.
 *
 */
- (void)start;

/**
 * Tells @client_view to stop processing events.
 *
 */
- (void)stop;

@end