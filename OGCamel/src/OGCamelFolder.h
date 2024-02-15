/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelObject.h"

@class OGCancellable;
@class OGCamelMessageInfo;
@class OGCamelMimeMessage;
@class OGCamelFolderSummary;
@class OGCamelStore;

@interface OGCamelFolder : OGCamelObject
{

}

/**
 * Functions
 */

/**
 *
 * @param c
 * @return
 */
+ (gint)threadedMessagesDump:(CamelFolderThreadNode*)c;

/**
 * Methods
 */

- (CamelFolder*)castedGObject;

/**
 * Appends @message to @folder asynchronously.  Only the flag and tag data
 * from @info are used.  If @info is %NULL, no flags or tags will be set.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_folder_append_message_finish() to get the result of
 * the operation.
 *
 * @param message a #CamelMimeMessage
 * @param info a #CamelMessageInfo with additional flags/etc to set
 *        on the new message, or %NULL
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)appendMessageWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_append_message_finish().
 *
 * @param result a #GAsyncResult
 * @param appendedUid if non-%NULL, the UID of
 *                the appended message will be returned here, if it is
 *                known
 * @return %TRUE on success, %FALSE on error
 */
- (bool)appendMessageFinishWithResult:(GAsyncResult*)result appendedUid:(gchar**)appendedUid;

/**
 * Appends @message to @folder.  Only the flag and tag data from @info
 * are used.  If @info is %NULL, no flags or tags will be set.
 *
 * @param message a #CamelMimeMessage
 * @param info a #CamelMessageInfo with additional flags/etc to set
 *        on the new message, or %NULL
 * @param appendedUid if non-%NULL, the UID
 *                of the appended message will be returned here, if it
 *                is known
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)appendMessageSyncWithMessage:(OGCamelMimeMessage*)message info:(OGCamelMessageInfo*)info appendedUid:(gchar**)appendedUid cancellable:(OGCancellable*)cancellable;

/**
 * Emits the #CamelFolder::changed signal from an idle source on the
 * main loop.  The idle source's priority is #G_PRIORITY_LOW.
 *
 * @param changes change information for @folder
 */
- (void)changed:(CamelFolderChangeInfo*)changes;

/**
 * Compares two uids. The return value meaning is the same as in any other compare function.
 * 
 * Note that the default compare function expects a decimal number at the beginning of a uid,
 * thus if provider uses different uid values, then it should subclass this function.
 *
 * @param uid1 The first uid.
 * @param uid2 the second uid.
 * @return
 */
- (gint)cmpUidsWithUid1:(OFString*)uid1 uid2:(OFString*)uid2;

/**
 * Searches the folder for count of messages matching the given search expression.
 *
 * @param expression a search expression
 * @param cancellable a #GCancellable
 * @return an interger
 */
- (guint32)countByExpressionWithExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable;

/**
 * Marks @folder as deleted and performs any required cleanup.
 * 
 * This also emits the #CamelFolder::deleted signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 *
 */
- (void)delete;

/**
 * Thread-safe variation of camel_folder_get_description().
 * Use this function when accessing @folder from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelFolder:description
 */
- (OFString*)dupDescription;

/**
 * Thread-safe variation of camel_folder_get_display_name().
 * Use this function when accessing @folder from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelFolder:display-name
 */
- (OFString*)dupDisplayName;

/**
 * Thread-safe variation of camel_folder_get_full_name().
 * Use this function when accessing @folder from multiple threads.
 * 
 * The returned string should be freed with g_free() when no longer needed.
 *
 * @return a newly-allocated copy of #CamelFolder:full-name
 */
- (OFString*)dupFullName;

/**
 * Asynchronously deletes messages which have been marked as "DELETED".
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_expunge_finish() to get the result of the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)expungeWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_expunge().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)expungeFinish:(GAsyncResult*)result;

/**
 * Deletes messages which have been marked as "DELETED".
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)expungeSync:(OGCancellable*)cancellable;

/**
 * Frees the provided array and its contents. Used by #CamelFolder
 * subclasses as an implementation for free_uids when the provided
 * information was created explicitly by the corresponding get_ call.
 *
 * @param array an array of uids
 */
- (void)freeDeep:(GPtrArray*)array;

/**
 * Frees the provided array but not its contents. Used by #CamelFolder
 * subclasses as an implementation for free_uids or free_summary when
 * the returned array needs to be freed but its contents come from
 * "static" information.
 *
 * @param array an array of uids or #CamelMessageInfo
 */
- (void)freeShallow:(GPtrArray*)array;

/**
 * Frees the summary array returned by camel_folder_get_summary().
 *
 * @param array the summary array to free
 */
- (void)freeSummary:(GPtrArray*)array;

/**
 * Frees the array of UIDs returned by camel_folder_get_uids().
 *
 * @param array the array of uids to free
 */
- (void)freeUids:(GPtrArray*)array;

/**
 * Freezes the folder so that a series of operation can be performed
 * without "folder_changed" signals being emitted.  When the folder is
 * later thawed with camel_folder_thaw(), the suppressed signals will
 * be emitted.
 *
 */
- (void)freeze;

/**
 *
 * @return the number of deleted messages in the folder, or -1 if
 * unknown
 */
- (gint)deletedMessageCount;

/**
 * Returns a description of the folder suitable for displaying to the user.
 *
 * @return a description of the folder
 */
- (OFString*)description;

/**
 * Returns the display name for the folder.  The fully qualified name
 * can be obtained with camel_folder_get_full_name().
 *
 * @return the display name of the folder
 */
- (OFString*)displayName;

/**
 *
 * @param uid a message UID
 * @return a file name corresponding to a message
 *   with UID @uid. Free the returned string with g_free(), when
 *   no longer needed.
 */
- (OFString*)filename:(OFString*)uid;

/**
 *
 * @return Folder flags (bit-or of #CamelFolderFlags) of the @folder
 */
- (guint32)flags;

/**
 *
 * @return a #CamelFolderSummary of the folder
 */
- (OGCamelFolderSummary*)folderSummary;

/**
 *
 * @return
 */
- (gint)frozenCount;

/**
 * Similar to the camel_folder_get_full_name(), only returning
 * full path to the @folder suitable for the display to a user.
 *
 * @return full path to the @folder suitable for the display to a user
 */
- (OFString*)fullDisplayName;

/**
 * Returns the fully qualified name of the folder.
 *
 * @return the fully qualified name of the folder
 */
- (OFString*)fullName;

/**
 *
 * @return a #CamelThreeState, whether messages in this @folder
 *    should be marked as seen automatically.
 */
- (CamelThreeState)markSeen;

/**
 *
 * @return timeout in milliseconds for marking messages
 *    as seen in this @folder
 */
- (gint)markSeenTimeout;

/**
 * Asynchronously gets the message corresponding to @message_uid from @folder.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_get_message_finish() to get the result of the operation.
 *
 * @param messageUid the message UID
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)messageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Gets the message corresponding to @message_uid from the @folder cache,
 * if available locally. This should not do any network I/O, only check
 * if message is already downloaded and return it quickly, not being
 * blocked by the folder's lock. Returning NULL is not considered as
 * an error, it just means that the message is still to-be-downloaded.
 * 
 * Note: This function is called automatically within camel_folder_get_message_sync().
 *
 * @param messageUid the message UID
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a cached #CamelMimeMessage corresponding
 *    to the requested UID
 */
- (OGCamelMimeMessage*)messageCachedWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable;

/**
 *
 * @return the number of messages in the folder, or -1 if unknown
 */
- (gint)messageCount;

/**
 * Finishes the operation started with camel_folder_get_message().
 *
 * @param result a #GAsyncResult
 * @return a #CamelMimeMessage corresponding to the requested UID
 */
- (OGCamelMimeMessage*)messageFinish:(GAsyncResult*)result;

/**
 *
 * @param uid the UID of a message in @folder
 * @return the #CamelMessageFlags that are set on the indicated
 * message.
 */
- (guint32)messageFlags:(OFString*)uid;

/**
 * Retrieve the #CamelMessageInfo for the specified @uid.
 *
 * @param uid the uid of a message
 * @return The summary information for the
 *   indicated message, or %NULL if the uid does not exist. Free the returned
 *   object with g_object_unref(), when done with it.
 */
- (OGCamelMessageInfo*)messageInfo:(OFString*)uid;

/**
 * Gets the message corresponding to @message_uid from @folder.
 *
 * @param messageUid the message UID
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a #CamelMimeMessage corresponding to the requested UID
 */
- (OGCamelMimeMessage*)messageSyncWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable;

/**
 *
 * @param uid the UID of a message in @folder
 * @param name the name of a user flag
 * @return %TRUE if the given user flag is set on the message or
 * %FALSE otherwise
 */
- (bool)messageUserFlagWithUid:(OFString*)uid name:(OFString*)name;

/**
 *
 * @param uid the UID of a message in @folder
 * @param name the name of a user tag
 * @return the value of the user tag
 */
- (OFString*)messageUserTagWithUid:(OFString*)uid name:(OFString*)name;

/**
 *
 * @return the parent #CamelStore of the folder
 */
- (OGCamelStore*)parentStore;

/**
 *
 * @return the set of #CamelMessageFlags that can be permanently
 * stored on a message between sessions. If it includes
 * #CAMEL_MESSAGE_USER, then user-defined flags will be remembered.
 */
- (guint32)permanentFlags;

/**
 * Asynchronously gets a list of known quotas for @folder.
 * 
 * When the operation is finished, @callback will be called.  You can
 * then call camel_folder_get_quota_info_finish() to get the result of
 * the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)quotaInfoWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_get_quota_info().
 * Free the returned #CamelFolderQuotaInfo struct with
 * camel_folder_quota_info_free().
 * 
 * If quotas are not supported for @folder, the function returns %NULL
 * and sets @error to #G_IO_ERROR_NOT_SUPPORTED.
 *
 * @param result a #GAsyncResult
 * @return a #CamelFolderQuotaInfo, or %NULL on error
 */
- (CamelFolderQuotaInfo*)quotaInfoFinish:(GAsyncResult*)result;

/**
 * Gets a list of known quotas for @folder.  Free the returned
 * #CamelFolderQuotaInfo struct with camel_folder_quota_info_free().
 * 
 * If quotas are not supported for @folder, the function returns %NULL
 * and sets @error to #G_IO_ERROR_NOT_SUPPORTED.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return a #CamelFolderQuotaInfo, or %NULL on error
 */
- (CamelFolderQuotaInfo*)quotaInfoSync:(OGCancellable*)cancellable;

/**
 * This returns the summary information for the folder. This array
 * should not be modified, and must be freed with
 * camel_folder_free_summary().
 *
 * @return an array of UID-s of #CamelMessageInfo
 */
- (GPtrArray*)summary;

/**
 * Get the list of UIDs available in a folder. This routine is useful
 * for finding what messages are available when the folder does not
 * support summaries. The returned array should not be modified, and
 * must be freed by passing it to camel_folder_free_uids().
 *
 * @return a GPtrArray of UIDs
 * corresponding to the messages available in the folder
 */
- (GPtrArray*)uids;

/**
 * Returns the known-uncached uids from a list of uids. It may return uids
 * which are locally cached but should never filter out a uid which is not
 * locally cached. Free the result by called camel_folder_free_uids().
 * Frees the array of UIDs returned by camel_folder_get_uids().
 *
 * @param uids the array of uids to filter down to uncached ones.
 * @return
 */
- (GPtrArray*)uncachedUids:(GPtrArray*)uids;

/**
 *
 * @return the number of unread messages in the folder, or -1 if
 * unknown
 */
- (gint)unreadMessageCount;

/**
 * Get whether or not the folder has a summary.
 *
 * @return %TRUE if a summary is available or %FALSE otherwise
 */
- (bool)hasSummaryCapability;

/**
 *
 * @return whether or not the folder is frozen
 */
- (bool)isFrozen;

/**
 * Locks @folder. Unlock it with camel_folder_unlock().
 *
 */
- (void)lock;

/**
 * Lets the @folder know that it should refresh its content
 * the next time from fresh. This is useful for remote accounts,
 * to fully re-check the folder content against the server.
 *
 */
- (void)prepareContentRefresh;

/**
 * Delete the local cache of all messages between these uids.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_purge_message_cache_finish() to get the result of the
 * operation.
 *
 * @param startUid the start message UID
 * @param endUid the end message UID
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)purgeMessageCacheWithStartUid:(OFString*)startUid endUid:(OFString*)endUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_purge_message_cache().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)purgeMessageCacheFinish:(GAsyncResult*)result;

/**
 * Delete the local cache of all messages between these uids.
 *
 * @param startUid the start message UID
 * @param endUid the end message UID
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)purgeMessageCacheSyncWithStartUid:(OFString*)startUid endUid:(OFString*)endUid cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously synchronizes a folder's summary with its backing store.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_refresh_info_finish() to get the result of the operation.
 *
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)refreshInfoWithIoPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_refresh_info().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)refreshInfoFinish:(GAsyncResult*)result;

/**
 * Synchronizes a folder's summary with its backing store.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)refreshInfoSync:(OGCancellable*)cancellable;

/**
 * Marks @folder as renamed.
 * 
 * This also emits the #CamelFolder::renamed signal from an idle source on
 * the main loop.  The idle source's priority is #G_PRIORITY_HIGH_IDLE.
 * 
 * NOTE: This is an internal function used by camel stores, no locking
 * is performed on the folder.
 *
 * @param newName new name for the folder
 */
- (void)rename:(OFString*)newName;

/**
 * Searches the folder for messages matching the given search expression.
 *
 * @param expression a search expression
 * @param cancellable a #GCancellable
 * @return a #GPtrArray of uids of
 * matching messages. The caller must free the list and each of the elements
 * when it is done.
 */
- (GPtrArray*)searchByExpressionWithExpression:(OFString*)expression cancellable:(OGCancellable*)cancellable;

/**
 * Search a subset of uid's for an expression match.
 *
 * @param expression search expression
 * @param uids array of uid's to match against.
 * @param cancellable a #GCancellable
 * @return a #GPtrArray of uids of
 * matching messages. The caller must free the list and each of the elements
 * when it is done.
 */
- (GPtrArray*)searchByUidsWithExpression:(OFString*)expression uids:(GPtrArray*)uids cancellable:(OGCancellable*)cancellable;

/**
 * Free the result of a search as gotten by camel_folder_search_by_expression()
 * or camel_folder_search_by_uids().
 *
 * @param result search results to free
 */
- (void)searchFree:(GPtrArray*)result;

/**
 * Sets a description of the folder suitable for displaying to the user.
 *
 * @param description a description of the folder
 */
- (void)setDescription:(OFString*)description;

/**
 * Sets the display name for the folder.
 *
 * @param displayName a display name for the folder
 */
- (void)setDisplayName:(OFString*)displayName;

/**
 * Sets folder flags (bit-or of #CamelFolderFlags) for the @folder.
 *
 * @param folderFlags flags (bit-or of #CamelFolderFlags) to set
 */
- (void)setFlags:(guint32)folderFlags;

/**
 * Sets the fully qualified name of the folder.
 *
 * @param fullName a fully qualified name for the folder
 */
- (void)setFullName:(OFString*)fullName;

/**
 * Sets whether folder locking (camel_folder_lock() and camel_folder_unlock())
 * should be used. When set to %FALSE, the two functions do nothing and simply
 * return.
 *
 * @param skipFolderLock a value to set
 */
- (void)setLockAsync:(bool)skipFolderLock;

/**
 * Sets whether the messages in this @folder should be marked
 * as seen automatically. An inconsistent state means to use
 * global option.
 *
 * @param markSeen a #CamelThreeState as the value to set
 */
- (void)setMarkSeen:(CamelThreeState)markSeen;

/**
 * Sets the @timeout in milliseconds for marking messages
 * as seen in this @folder. Whether the timeout is used
 * depends on camel_folder_get_mark_seen().
 *
 * @param timeout a timeout in milliseconds
 */
- (void)setMarkSeenTimeout:(gint)timeout;

/**
 * Sets those flags specified by @mask to the values specified by @set
 * on the indicated message. (This may or may not persist after the
 * folder or store is closed. See camel_folder_get_permanent_flags())
 * 
 * E.g. to set the deleted flag and clear the draft flag, use
 * camel_folder_set_message_flags (folder, uid, CAMEL_MESSAGE_DELETED|CAMEL_MESSAGE_DRAFT, CAMEL_MESSAGE_DELETED);
 *
 * @param uid the UID of a message in @folder
 * @param mask a mask of #CamelMessageFlags bit-or values to use
 * @param set the flags to ser, also bit-or of #CamelMessageFlags
 * @return %TRUE if the flags were changed or %FALSE otherwise
 */
- (bool)setMessageFlagsWithUid:(OFString*)uid mask:(guint32)mask set:(guint32)set;

/**
 *
 * @param uid the UID of a message in @folder
 * @param name the name of the user flag to set
 * @param value the value to set it to
 */
- (void)setMessageUserFlagWithUid:(OFString*)uid name:(OFString*)name value:(bool)value;

/**
 *
 * @param uid the UID of a message in @folder
 * @param name the name of the user tag to set
 * @param value the value to set it to
 */
- (void)setMessageUserTagWithUid:(OFString*)uid name:(OFString*)name value:(OFString*)value;

/**
 * Sorts the array of UIDs.
 *
 * @param uids array of uids
 */
- (void)sortUids:(GPtrArray*)uids;

/**
 * Synchronizes any changes that have been made to @folder to its backing
 * store asynchronously, optionally expunging deleted messages as well.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_synchronize_finish() to get the result of the operation.
 *
 * @param expunge whether to expunge after synchronizing
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)synchronizeWithExpunge:(bool)expunge ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_synchronize().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeFinish:(GAsyncResult*)result;

/**
 * Asynchronously ensure that a message identified by @message_uid has been
 * synchronized in @folder so that calling camel_folder_get_message() on it
 * later will work in offline mode.
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_synchronize_message_finish() to get the result of the
 * operation.
 *
 * @param messageUid a message UID
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)synchronizeMessageWithMessageUid:(OFString*)messageUid ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_synchronize_message().
 *
 * @param result a #GAsyncResult
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeMessageFinish:(GAsyncResult*)result;

/**
 * Ensure that a message identified by @message_uid has been synchronized in
 * @folder so that calling camel_folder_get_message() on it later will work
 * in offline mode.
 *
 * @param messageUid a message UID
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeMessageSyncWithMessageUid:(OFString*)messageUid cancellable:(OGCancellable*)cancellable;

/**
 * Synchronizes any changes that have been made to @folder to its
 * backing store, optionally expunging deleted messages as well.
 *
 * @param expunge whether to expunge after synchronizing
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on error
 */
- (bool)synchronizeSyncWithExpunge:(bool)expunge cancellable:(OGCancellable*)cancellable;

/**
 * Sets a #CamelFolderSummary of the folder. It consumes the @summary.
 * 
 * This is supposed to be called only by the descendants of
 * the #CamelFolder and only at the construction time. Calling
 * this function twice yeilds to an error.
 *
 * @param summary a #CamelFolderSummary
 */
- (void)takeFolderSummary:(OGCamelFolderSummary*)summary;

/**
 * Thaws the folder and emits any pending folder_changed
 * signals.
 *
 */
- (void)thaw;

/**
 * Asynchronously copies or moves messages from one folder to another.
 * If the @source or @destination folders have the same parent store,
 * this may be more efficient than using camel_folder_append_message().
 * 
 * When the operation is finished, @callback will be called.  You can then
 * call camel_folder_transfer_messages_to_finish() to get the result of the
 * operation.
 *
 * @param messageUids message UIDs in @source
 * @param destination the destination #CamelFolder
 * @param deleteOriginals whether or not to delete the original messages
 * @param ioPriority the I/O priority of the request
 * @param cancellable optional #GCancellable object, or %NULL
 * @param callback a #GAsyncReadyCallback to call when the request is satisfied
 * @param userData data to pass to the callback function
 */
- (void)transferMessagesToWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes the operation started with camel_folder_transfer_messages_to().
 *
 * @param result a #GAsyncResult
 * @param transferredUids if
 *                    non-%NULL, the UIDs of the resulting messages in
 *                    @destination will be stored here, if known.
 * @return %TRUE on success, %FALSE on error
 */
- (bool)transferMessagesToFinishWithResult:(GAsyncResult*)result transferredUids:(GPtrArray**)transferredUids;

/**
 * Copies or moves messages from one folder to another.  If the
 * @source and @destination folders have the same parent_store, this
 * may be more efficient than using camel_folder_append_message_sync().
 *
 * @param messageUids message UIDs in @source
 * @param destination the destination #CamelFolder
 * @param deleteOriginals whether or not to delete the original messages
 * @param transferredUids if
 *                    non-%NULL, the UIDs of the resulting messages in
 *                    @destination will be stored here, if known.
 * @param cancellable optional #GCancellable object, or %NULL
 * @return %TRUE on success, %FALSE on failure
 */
- (bool)transferMessagesToSyncWithMessageUids:(GPtrArray*)messageUids destination:(OGCamelFolder*)destination deleteOriginals:(bool)deleteOriginals transferredUids:(GPtrArray**)transferredUids cancellable:(OGCancellable*)cancellable;

/**
 * Unlocks @folder, previously locked with camel_folder_lock().
 *
 */
- (void)unlock;

@end