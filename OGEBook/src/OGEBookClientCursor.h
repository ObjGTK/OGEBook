/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libebook/libebook.h>

#import <OGObject/OGObject.h>

@class OGEBookClient;
@class OGCancellable;
@class OGEContact;

/**
 * Contains only private data.
 *
 */
@interface OGEBookClientCursor : OGObject
{

}


/**
 * Methods
 */

- (EBookClientCursor*)castedGObject;

/**
 * Fetches the array of displayable labels for the <link linkend="cursor-alphabet">active alphabet</link>.
 * 
 * The active alphabet is based on the current locale configuration of the
 * addressbook, and can be a different alphabet for locales requiring non-Latin
 * language scripts. These UTF-8 labels are appropriate to display in a user
 * interface to represent the alphabetic position of the cursor in the user's
 * native alphabet.
 * 
 * The @underflow, @inflow and @overflow parameters allow one to observe which
 * indexes Evolution Data Server is using to store words which sort outside
 * of the alphabet, for instance words from foreign language scripts and
 * words which start with numeric characters, or other types of character.
 * 
 * While the @underflow and @overflow are for words which sort below or
 * above the active alphabets, the @inflow index is for words which sort
 * in between multiple concurrently active alphabets. The active alphabet
 * array might contain more than one alphabet for locales where it is
 * very common or expected to have names in Latin script as well as names
 * in another script.
 *
 * @param nlabels The number of labels in the active alphabet
 * @param underflow The underflow index, for any words which sort below the active alphabet
 * @param inflow The inflow index, for any words which sort between the active alphabets (if there is more than one)
 * @param overflow The overflow index, for any words which sort above the active alphabet
 * @return The array of displayable labels for each index in the active alphabet.
 */
- (const gchar* const*)alphabetWithNlabels:(gint*)nlabels underflow:(gint*)underflow inflow:(gint*)inflow overflow:(gint*)overflow;

/**
 * Checks which alphabetic index @contact would be sorted
 * into according to @cursor.
 * 
 * So long as the active #EBookClientCursor:alphabet does
 * not change, the returned index will be a valid position
 * in the array of labels returned by e_book_client_cursor_get_alphabet().
 * 
 * If the index returned by this function is needed for
 * any extended period of time, it should be recalculated
 * whenever the #EBookClientCursor:alphabet changes.
 *
 * @param contact the #EContact to check
 * @return The alphabetic index of @contact in @cursor.
 */
- (gint)contactAlphabeticIndex:(OGEContact*)contact;

/**
 * Fetches the number of contacts leading up to the current
 * cursor position, inclusive of the current cursor position.
 * 
 * The position value can be anywhere from 0 to the total
 * number of contacts plus one. A value of 0 indicates
 * that the cursor is positioned before the contact list in
 * the symbolic %E_BOOK_CURSOR_ORIGIN_BEGIN state. If
 * the position is greater than the total, as returned by
 * e_book_client_cursor_get_total(), then the cursor is positioned
 * after the last contact in the symbolic %E_BOOK_CURSOR_ORIGIN_END position.
 *
 * @return The current cursor position
 */
- (gint)position;

/**
 * Fetches the total number of contacts in the addressbook
 * which match @cursor's query
 *
 * @return The total number of contacts matching @cursor's query
 */
- (gint)total;

/**
 * Returns the #EBookClientCursor:client associated with @cursor.
 * 
 * The returned #EBookClient is referenced because the cursor
 * does not keep a strong reference to the client.
 * 
 * Unreference the #EBookClient with g_object_unref() when finished with it.
 *
 * @return an #EBookClient
 */
- (OGEBookClient*)refClient;

/**
 * Sets the current cursor position to point to an <link linkend="cursor-alphabet">Alphabetic Index</link>.
 * 
 * See: e_book_client_cursor_set_alphabetic_index_sync().
 * 
 * This asynchronous call is completed with a call to
 * e_book_client_cursor_set_alphabetic_index_finish() from the specified @callback.
 *
 * @param index the alphabetic index
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)setAlphabeticIndexWithIndex:(gint)index cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Completes an asynchronous call initiated by e_book_client_cursor_set_alphabetic_index().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, otherwise %FALSE is returned and @error is set.
 */
- (bool)setAlphabeticIndexFinish:(GAsyncResult*)result;

/**
 * Sets the cursor to point to an <link linkend="cursor-alphabet">Alphabetic Index</link>.
 * 
 * After setting the alphabetic index, for example the
 * index for letter 'E', then further calls to e_book_client_cursor_step()
 * will return results starting with the letter 'E' (or results starting
 * with the last result in 'D' when navigating through cursor results
 * in reverse).
 * 
 * The passed index must be a valid index into the alphabet parameters
 * returned by e_book_client_cursor_get_alphabet().
 * 
 * If this method is called from the same thread context in which
 * the cursor was created, then the updates to the #EBookClientCursor:position
 * property are guaranteed to be delivered synchronously upon successful completion
 * of moving the cursor. Otherwise, notifications will be delivered asynchronously
 * in the cursor's original thread context.
 * 
 * If this method completes with an %E_CLIENT_ERROR_OUT_OF_SYNC error, it is an
 * indication that the addressbook has been set into a new locale and it would be
 * unsafe to set the alphabetic index at this time. If you receive an out of sync
 * error from this method, then you should wait until an #EBookClientCursor:alphabet
 * property change notification is delivered and then proceed to load the new
 * alphabet before trying to set any alphabetic index.
 *
 * @param index the alphabetic index
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @return %TRUE on success, otherwise %FALSE is returned and @error is set.
 */
- (bool)setAlphabeticIndexSyncWithIndex:(gint)index cancellable:(OGCancellable*)cancellable;

/**
 * Sets the <link linkend="cursor-search">Search Expression</link> for the cursor.
 * 
 * See: e_book_client_cursor_set_sexp_sync().
 * 
 * This asynchronous call is completed with a call to
 * e_book_client_cursor_set_sexp_finish() from the specified @callback.
 *
 * @param sexp the new search expression for @cursor
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)setSexpWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Completes an asynchronous call initiated by e_book_client_cursor_set_sexp(), reporting
 * whether the new search expression was accepted.
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, otherwise %FALSE is returned and @error is set.
 */
- (bool)setSexpFinish:(GAsyncResult*)result;

/**
 * Sets the <link linkend="cursor-search">Search Expression</link> for the cursor.
 * 
 * A side effect of setting the search expression is that the
 * <link linkend="cursor-pos-total">position and total</link>
 * properties will be updated.
 * 
 * If this method is called from the same thread context in which
 * the cursor was created, then the updates to the #EBookClientCursor:position
 * and #EBookClientCursor:total properties are guaranteed to be delivered
 * synchronously upon successful completion of setting the search expression.
 * Otherwise, notifications will be delivered asynchronously in the cursor's
 * original thread context.
 * 
 * If the backend does not support the given search expression,
 * an %E_CLIENT_ERROR_INVALID_QUERY error will be set.
 *
 * @param sexp the new search expression for @cursor
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @return %TRUE on success, otherwise %FALSE is returned and @error is set.
 */
- (bool)setSexpSyncWithSexp:(OFString*)sexp cancellable:(OGCancellable*)cancellable;

/**
 * <link linkend="cursor-iteration">Steps the cursor through the results</link> by
 * a maximum of @count and fetch the results traversed.
 * 
 * See: e_book_client_cursor_step_sync().
 * 
 * This asynchronous call is completed with a call to
 * e_book_client_cursor_step_finish() from the specified @callback.
 *
 * @param flags The #EBookCursorStepFlags for this step
 * @param origin The #EBookCursorOrigin from whence to step
 * @param count a positive or negative amount of contacts to try and fetch
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @param callback callback to call when a result is ready
 * @param userData user data for the @callback
 */
- (void)stepWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Completes an asynchronous call initiated by e_book_client_cursor_step(), fetching
 * any contacts which might have been returned by the call.
 *
 * @param result a #GAsyncResult
 * @param outContacts return location for a #GSList of #EContact
 * @return The number of contacts traversed if successful, otherwise -1 is
 * returned and @error is set.
 */
- (gint)stepFinishWithResult:(GAsyncResult*)result outContacts:(GSList**)outContacts;

/**
 * <link linkend="cursor-iteration">Steps the cursor through the results</link> by
 * a maximum of @count and fetch the results traversed.
 * 
 * If @count is negative, then the cursor will move backwards.
 * 
 * If @cursor reaches the beginning or end of the query results, then the
 * returned list might not contain the amount of desired contacts, or might
 * return no results if the cursor currently points to the last contact.
 * Reaching the end of the list is not considered an error condition. Attempts
 * to step beyond the end of the list after having reached the end of the list
 * will however trigger an %E_CLIENT_ERROR_QUERY_REFUSED error.
 * 
 * If %E_BOOK_CURSOR_STEP_FETCH is specified in @flags, a pointer to
 * a %NULL #GSList pointer should be provided for the @results parameter.
 * 
 * If %E_BOOK_CURSOR_STEP_MOVE is specified in @flags, then the cursor's
 * state will be modified and the <link linkend="cursor-pos-total">position</link>
 * property will be updated as a result.
 * 
 * If this method is called from the same thread context in which
 * the cursor was created, then the updates to the #EBookClientCursor:position
 * property are guaranteed to be delivered synchronously upon successful completion
 * of moving the cursor. Otherwise, notifications will be delivered asynchronously
 * in the cursor's original thread context.
 * 
 * If this method completes with an %E_CLIENT_ERROR_OUT_OF_SYNC error, it is an
 * indication that the addressbook has been modified and it would be unsafe to
 * move the cursor at this time. Any %E_CLIENT_ERROR_OUT_OF_SYNC error is guaranteed
 * to be followed by an #EBookClientCursor::refresh signal at which point any content
 * should be reloaded.
 *
 * @param flags The #EBookCursorStepFlags for this step
 * @param origin The #EBookCursorOrigin from whence to step
 * @param count a positive or negative amount of contacts to try and fetch
 * @param outContacts return location for a #GSList of #EContact
 * @param cancellable a #GCancellable to optionally cancel this operation while in progress
 * @return The number of contacts traversed if successful, otherwise -1 is
 * returned and @error is set.
 */
- (gint)stepSyncWithFlags:(EBookCursorStepFlags)flags origin:(EBookCursorOrigin)origin count:(gint)count outContacts:(GSList**)outContacts cancellable:(OGCancellable*)cancellable;

@end