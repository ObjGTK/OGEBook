/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelFolder;
@class OGCamelIndex;
@class OGCamelMessageInfo;
@class OGCamelMimeMessage;
@class OGCamelMimeParser;
@class OGCamelStore;

@interface OGCamelFolderSummary : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Free's array and its elements returned from camel_folder_summary_get_array().
 *
 * @param array a #GPtrArray returned from camel_folder_summary_get_array()
 */
+ (void)freeArray:(GPtrArray*)array;

/**
 * Constructors
 */
- (instancetype)initWithFolder:(OGCamelFolder*)folder;

/**
 * Methods
 */

- (CamelFolderSummary*)castedGObject;

/**
 * Adds a new @info record to the summary. If the @force_keep_uid is %FALSE,
 * then a new uid is automatically re-assigned by calling
 * camel_folder_summary_next_uid_string(). It's an error to use
 * @force_keep_uid when the @info has none set.
 * 
 * The @summary adds its own reference to @info, if needed, and any
 * previously loaded info is replaced with the new one.
 *
 * @param info a #CamelMessageInfo
 * @param forceKeepUid whether to keep set UID of the @info
 */
- (void)addWithInfo:(OGCamelMessageInfo*)info forceKeepUid:(bool)forceKeepUid;

/**
 * Check if the uid is valid. This isn't very efficient, so it shouldn't be called iteratively.
 *
 * @param uid a uid
 * @return if the uid is present in the summary or not  (%TRUE or %FALSE)
 */
- (bool)checkUid:(OFString*)uid;

/**
 * Empty the summary contents.
 *
 * @return whether succeeded
 */
- (bool)clear;

/**
 * Get the number of summary items stored in this summary.
 *
 * @return the number of items in the summary
 */
- (guint)count;

/**
 * Retrieve a summary item by uid.
 * 
 * A referenced to the summary item is returned, which may be
 * ref'd or free'd as appropriate.
 *
 * @param uid a uid
 * @return the summary item, or %NULL if the uid @uid is not available
 * 
 * See camel_folder_summary_get_info_flags().
 */
- (OGCamelMessageInfo*)get:(OFString*)uid;

/**
 * Obtain a copy of the summary array.  This is done atomically,
 * so cannot contain empty entries.
 * 
 * Free with camel_folder_summary_free_array()
 *
 * @return a #GPtrArray of uids
 */
- (GPtrArray*)array;

/**
 * Returns an array of changed UID-s. A UID is considered changed
 * when its corresponding CamelMesageInfo is 'dirty' or when it has
 * set the #CAMEL_MESSAGE_FOLDER_FLAGGED flag.
 *
 * @return a #GPtrArray with changed UID-s.
 *    Free it with camel_folder_summary_free_array() when no longer needed.
 */
- (GPtrArray*)changed;

/**
 *
 * @return Count of deleted infos.
 */
- (guint32)deletedCount;

/**
 *
 * @return flags of the @summary, a bit-or of #CamelFolderSummaryFlags
 */
- (guint32)flags;

/**
 *
 * @return a #CamelFolder to which the summary if associated.
 */
- (OGCamelFolder*)folder;

/**
 * Returns hash of current stored 'uids' in summary, where key is 'uid'
 * from the string pool, and value is 1. The returned pointer should
 * be freed with g_hash_table_destroy().
 * 
 * Note: When searching for values always use uids from the string pool.
 *
 * @return
 */
- (GHashTable*)hash;

/**
 *
 * @return a #CamelIndex used to index body content.
 */
- (OGCamelIndex*)index;

/**
 * Retrieve CamelMessageInfo::flags for a message info with UID @uid.
 * This is much quicker than camel_folder_summary_get(), because it
 * doesn't require reading the message info from a disk.
 *
 * @param uid a uid
 * @return the flags currently stored for message info with UID @uid,
 *          or (~0) on error
 */
- (guint32)infoFlags:(OFString*)uid;

/**
 *
 * @return Count of junk infos.
 */
- (guint32)junkCount;

/**
 *
 * @return Count of junk and not deleted infos.
 */
- (guint32)junkNotDeletedCount;

/**
 *
 * @return Next uid currently awaiting for assignment. The difference from
 *    camel_folder_summary_next_uid() is that this function returns actual
 *    value and doesn't increment it before returning.
 */
- (guint32)nextUid;

/**
 *
 * @return Count of saved infos.
 */
- (guint32)savedCount;

/**
 *
 * @return timestamp of the @summary, as set by the descendants
 */
- (gint64)timestamp;

/**
 *
 * @return Count of unread infos.
 */
- (guint32)unreadCount;

/**
 *
 * @return version of the @summary
 */
- (guint32)version;

/**
 *
 * @return Count of visible (not junk and not deleted) infos.
 */
- (guint32)visibleCount;

/**
 * Loads a summary header for the @summary, which corresponds to @folder_name
 * provided by @store.
 *
 * @param store a #CamelStore
 * @param folderName a folder name corresponding to @summary
 * @return whether succeeded
 */
- (bool)headerLoadWithStore:(OGCamelStore*)store folderName:(OFString*)folderName;

/**
 * Saves summary header information into the disk. The function does
 * nothing, if the summary doesn't support save to disk.
 *
 * @return whether succeeded
 */
- (bool)headerSave;

/**
 * Create a new info record from a header.
 *
 * @param headers rfc822 headers as #CamelNameValueArray
 * @return a newly created #CamelMessageInfo. Unref it
 *   with g_object_unref(), when done with it.
 */
- (OGCamelMessageInfo*)infoNewFromHeaders:(const CamelNameValueArray*)headers;

/**
 * Create a summary item from a message.
 *
 * @param message a #CamelMimeMessage object
 * @return a newly created #CamelMessageInfo. Unref it
 *   with g_object_unref(), when done with it.
 */
- (OGCamelMessageInfo*)infoNewFromMessage:(OGCamelMimeMessage*)message;

/**
 * Create a new info record from a parser.  If the parser cannot
 * determine a uid, then none will be assigned.
 * 
 * If indexing is enabled, and the parser cannot determine a new uid, then
 * one is automatically assigned.
 * 
 * If indexing is enabled, then the content will be indexed based
 * on this new uid.  In this case, the message info MUST be
 * added using :add().
 * 
 * Once complete, the parser will be positioned at the end of
 * the message.
 *
 * @param parser a #CamelMimeParser object
 * @return a newly created #CamelMessageInfo. Unref it
 *   with g_object_unref(), when done with it.
 */
- (OGCamelMessageInfo*)infoNewFromParser:(OGCamelMimeParser*)parser;

/**
 * Loads the summary from the disk. It also saves any pending
 * changes first.
 *
 * @return whether succeeded
 */
- (bool)load;

/**
 * Locks @summary. Unlock it with camel_folder_summary_unlock().
 *
 */
- (void)lock;

/**
 * Generate a new unique uid value as an integer.  This
 * may be used to create a unique sequence of numbers.
 *
 * @return the next unique uid value
 */
- (guint32)generateNextUid;

/**
 * Retrieve the next uid, but as a formatted string.
 *
 * @return the next uid as an unsigned integer string.
 * This string must be freed by the caller.
 */
- (OFString*)nextUidString;

/**
 *
 * @param uid a message UID to look for
 * @return a #CamelMessageInfo for the given @uid,
 *    if it's currently loaded in memory, or %NULL otherwise. Unref the non-NULL
 *    info with g_object_unref() when done with it.
 */
- (OGCamelMessageInfo*)peekLoaded:(OFString*)uid;

/**
 * Loads all infos into memory, if they are not yet and ensures
 * they will not be freed in next couple minutes. Call this function
 * before any mass operation or when all message infos will be needed,
 * for better performance.
 *
 */
- (void)prepareFetchAll;

/**
 * Remove a specific @info record from the summary.
 *
 * @param info a #CamelMessageInfo
 * @return Whether the @info was found and removed from the @summary.
 */
- (bool)remove:(OGCamelMessageInfo*)info;

/**
 * Remove a specific info record from the summary, by @uid.
 *
 * @param uid a uid
 * @return Whether the @uid was found and removed from the @summary.
 */
- (bool)removeUid:(OFString*)uid;

/**
 * Remove a specific info record from the summary, by @uid.
 *
 * @param uids a GList of uids
 * @return Whether the @uid was found and removed from the @summary.
 */
- (bool)removeUids:(GList*)uids;

/**
 * Updates internal counts based on the flags in @info.
 *
 * @param info a #CamelMessageInfo
 * @return Whether any count changed
 */
- (bool)replaceFlags:(OGCamelMessageInfo*)info;

/**
 * Saves the content of the @summary to disk. It does nothing,
 * when the summary is not changed or when it doesn't support
 * permanent save.
 *
 * @return whether succeeded
 */
- (bool)save;

/**
 * Sets flags of the @summary, a bit-or of #CamelFolderSummaryFlags.
 *
 * @param flags flags to set
 */
- (void)setFlags:(guint32)flags;

/**
 * Set the index used to index body content.  If the index is %NULL, or
 * not set (the default), no indexing of body content will take place.
 *
 * @param index a #CamelIndex
 */
- (void)setIndex:(OGCamelIndex*)index;

/**
 * Set the next minimum uid available.  This can be used to
 * ensure new uid's do not clash with existing uid's.
 *
 * @param uid The next minimum uid to assign.  To avoid clashing
 * uid's, set this to the uid of a given messages + 1.
 */
- (void)setNextUid:(guint32)uid;

/**
 * Sets timestamp of the @summary, provided by the descendants. This doesn't
 * change the 'dirty' flag of the @summary.
 *
 * @param timestamp a timestamp to set
 */
- (void)setTimestamp:(gint64)timestamp;

/**
 * Sets version of the @summary.
 *
 * @param version version to set
 */
- (void)setVersion:(guint32)version;

/**
 * Mark the summary as changed, so that a save will force it to be
 * written back to disk.
 *
 */
- (void)touch;

/**
 * Unlocks @summary, previously locked with camel_folder_summary_lock().
 *
 */
- (void)unlock;

@end
