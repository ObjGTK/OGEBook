/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelFolderSummary;

@interface OGCamelMessageInfo : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init:(OGCamelFolderSummary*)summary;
- (instancetype)initFromHeadersWithSummary:(OGCamelFolderSummary*)summary headers:(const CamelNameValueArray*)headers;

/**
 * Methods
 */

- (CamelMessageInfo*)MESSAGEINFO;

/**
 * Clones the @mi as a new #CamelMessageInfo and eventually assigns
 * a new #CamelFolderSummary to it. If it's not set, then the same
 * summary as the one with @mi is used.
 *
 * @param assignSummary parent #CamelFolderSummary object, or %NULL, to set on the clone
 * @return a new #CamelMessageInfo object, clone of the @mi
 */
- (OGCamelMessageInfo*)clone:(OGCamelFolderSummary*)assignSummary;

/**
 * Dumps the mesasge info @mi to stdout. This is meand for debugging
 * purposes only.
 *
 */
- (void)dump;

/**
 * Duplicates array of headers for the @mi.
 *
 * @return All the message headers of the associated
 *   message, or %NULL, when none are available. Free returned array with
 *   camel_name_value_array_free() when no longer needed.
 */
- (CamelNameValueArray*)dupHeaders;

/**
 * Duplicates encoded In-Reply-To and References headers of the associated
 * message as an array of guint64 numbers, partial MD5 sums. Each value
 * can be cast to #CamelSummaryMessageID.
 *
 * @return A #GArray of
 *   guint64 encoded Message-ID-s; or %NULL when none are available. Free returned
 *   array with g_array_unref() when no longer needed.
 */
- (GArray*)dupReferences;

/**
 *
 * @return A newly allocated #CamelNamedFlags with all the currently set
 *   user flags on the @mi. Free the returned structure with camel_named_flags_free()
 *   when no londer needed.
 */
- (CamelNamedFlags*)dupUserFlags;

/**
 *
 * @param name user tag name
 * @return Value of the user tag as newly allocated
 *   string, or %NULL when it is not set. Free it with g_free() when no longer needed.
 */
- (OFString*)dupUserTag:(OFString*)name;

/**
 *
 * @return a newly allocated #CamelNameValueArray containing all set
 *   user tags of the @mi. Free it with camel_name_value_array_free() when no longer needed.
 */
- (CamelNameValueArray*)dupUserTags;

/**
 * Freezes all the notifications until the camel_message_info_thaw_notifications() is called.
 * This function can be called multiple times, where the last thaw will do the notifications.
 *
 */
- (void)freezeNotifications;

/**
 *
 * @return Whether the @mi is aborting notifications, which means
 *   that it will not influence 'dirty' and 'folder-flagged' flags
 *   in the set/take functions, neither it will emit any GObject::notify
 *   signals on change, nor associated folder's "changed" signal.
 */
- (bool)abortNotifications;

/**
 *
 * @return CC address of the @mi.
 */
- (OFString*)cc;

/**
 *
 * @return time_t of the Received header of the message, encoded as gint64.
 */
- (gint64)dateReceived;

/**
 *
 * @return time_t of the Date header of the message, encoded as gint64.
 */
- (gint64)dateSent;

/**
 *
 * @return Whether the @mi is dirty, which means that it had been
 *   changed and a save to the local summary is required.
 */
- (bool)dirty;

/**
 *
 * @return Bit-or of #CamelMessageFlags set on the @mi.
 */
- (guint32)flags;

/**
 * The folder flagged flag is used to mark the message infor as being changed
 * and this change should be propagated to the remote store (server). This is
 * different from the 'dirty' flag, which is set for local changes only. It
 * can happen that the 'folder-flagged' flag is set, but the 'dirty' flag not.
 * 
 * This is only a convenient wrapper around CAMEL_MESSAGE_FOLDER_FLAGGED flag,
 * for better readiness of the code.
 *
 * @return Whether requires save of the local changes into the remote store.
 */
- (bool)folderFlagged;

/**
 * The 'folder-flagged-stamp' is a stamp of the 'folder-flagged' flag. This stamp
 * changes whenever anything would mark the @mi as 'folder-flagged', regardless
 * the @mi being already 'folder-flagged'. It can be used to recognize changes
 * on the 'folder-flagged' flag during the time.
 *
 * @return Stamp of the 'folder-flagged' flag.
 */
- (guint)folderFlaggedStamp;

/**
 *
 * @return From address of the @mi.
 */
- (OFString*)from;

/**
 *
 * @return All the message headers of the associated
 *   message, or %NULL, when none are available.
 */
- (const CamelNameValueArray*)headers;

/**
 * Encoded Message-ID of the associated message as a guint64 number,
 * partial MD5 sum. The value can be cast to #CamelSummaryMessageID.
 *
 * @return Partial MD5 hash of the Message-ID header of the associated message.
 */
- (guint64)messageId;

/**
 *
 * @return Mailing list address of the @mi.
 */
- (OFString*)mlist;

/**
 *
 * @return Whether the notifications are frozen.
 * 
 * See: camel_message_info_freeze_notifications()
 */
- (bool)notificationsFrozen;

/**
 * Gets encoded In-Reply-To and References headers of the associated
 * message as an array of guint64 numbers, partial MD5 sums. Each value
 * can be cast to #CamelSummaryMessageID.
 *
 * @return A #GArray of
 *   guint64 encoded Message-ID-s; or %NULL when none are available.
 */
- (const GArray*)references;

/**
 *
 * @return Size of the associated message.
 */
- (guint32)size;

/**
 *
 * @return Subject of the #mi.
 */
- (OFString*)subject;

/**
 *
 * @return To address of the @mi.
 */
- (OFString*)to;

/**
 * Get the UID of the #mi.
 *
 * @return The UID of the @mi.
 */
- (OFString*)uid;

/**
 *
 * @param name user flag name
 * @return Whther the user flag named @name is set.
 */
- (bool)userFlag:(OFString*)name;

/**
 *
 * @return A #CamelNamedFlags with all the currently set
 *   user flags on the @mi. Do not modify it.
 */
- (const CamelNamedFlags*)userFlags;

/**
 *
 * @param name user tag name
 * @return Value of the user tag, or %NULL when
 *   it is not set.
 */
- (OFString*)userTag:(OFString*)name;

/**
 *
 * @return a #CamelNameValueArray containing all set
 *   user tags of the @mi. Do not modify it.
 */
- (const CamelNameValueArray*)userTags;

/**
 * Load content of @mi from the data stored in @record. The @bdata_ptr points
 * to the current position of the record->bdata, where the read can continue.
 * Use helper functions camel_util_bdata_get_number() and camel_util_bdata_get_string()
 * to read data from it and also move forward the *bdata_ptr.
 * 
 * After successful load of the @mi, the 'dirty' flag is unset.
 *
 * @param record a #CamelMIRecord to load the @mi from
 * @param bdataPtr a backend specific data (bdata) pointer
 * @return Whether the load was successful.
 */
- (bool)loadWithRecord:(const struct _CamelMIRecord*)record bdataPtr:(gchar**)bdataPtr;

/**
 * Get the UID of the #mi, duplicated on the Camel's string pool.
 * This is good for thread safety, though the UID should not change once set.
 *
 * @return A newly references string in the string pool, the #mi UID.
 *   Free it with camel_pstring_free() when no longer needed.
 */
- (OFString*)pooldupUid;

/**
 * Acquires a property lock, which is used to ensure thread safety
 * when properties are changing. Release the lock with
 * camel_message_info_property_unlock().
 * 
 * Note: Make sure the CamelFolderSummary lock is held before this lock,
 * if there will be called any 'set' function on the @mi, to avoid deadlock
 * when the summary would be set as dirty while another thread might try
 * to read values from the @mi, waiting for the property lock and holding
 * the summary lock at the same time.
 *
 */
- (void)propertyLock;

/**
 * Releases a property lock, previously acquired with
 * camel_message_info_property_lock().
 *
 */
- (void)propertyUnlock;

/**
 *
 * @return Referenced #CamelFolderSummary to which the @mi belongs, or %NULL,
 * if there is none. Use g_object_unref() for non-NULL returned values when done with it.
 */
- (OGCamelFolderSummary*)refSummary;

/**
 * Save the @mi content to the message info record @record. It can populate all
 * but the record->bdata value, which is set fro mthe @bdata_str. Use helper functions
 * camel_util_bdata_put_number() and camel_util_bdata_put_string() to put data into the @bdata_str.
 *
 * @param record a #CamelMIRecord to populate
 * @param bdataStr a #GString with a string to save as backend specific data (bdata)
 * @return Whether the save succeeded.
 */
- (bool)saveWithRecord:(CamelMIRecord*)record bdataStr:(GString*)bdataStr;

/**
 * Marks the @mi to abort any notifications, which means that it
 * will not influence 'dirty' and 'folder-flagged' flags in
 * the set/take functions, neither it will emit any GObject::notify
 * signals on change, nor associated folder's "changed" signal.
 *
 * @param abortNotifications a state to set
 */
- (void)setAbortNotifications:(bool)abortNotifications;

/**
 * Sets CC from the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param cc a CC to set
 * @return Whether the value changed.
 */
- (bool)setCc:(OFString*)cc;

/**
 * Sets received date (the Received header) of the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param dateReceived a received date to set
 * @return Whether the value changed.
 */
- (bool)setDateReceived:(gint64)dateReceived;

/**
 * Sets sent date (the Date header) of the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param dateSent a sent date to set
 * @return Whether the value changed.
 */
- (bool)setDateSent:(gint64)dateSent;

/**
 * Marks the @mi as dirty, which means a save to the local summary
 * is required.
 *
 * @param dirty a dirty state to set
 */
- (void)setDirty:(bool)dirty;

/**
 * Change the state of the flags on the @mi. Both @mask and @set are bit-or
 * of #CamelMessageFlags.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is also emitted
 * folder's "changed" signal for this @mi, if necessary. In case
 * the CAMEL_MESSAGE_FOLDER_FLAGGED flag would be set and the @mi is
 * not aborting notifications, the 'folder-flagged-stamp' changes too.
 *
 * @param mask mask of flags to change
 * @param set state the flags should be changed to
 * @return Whether the flags changed.
 */
- (bool)setFlagsWithMask:(guint32)mask set:(guint32)set;

/**
 * Changes the folder-flagged flag to the @folder_flagged value. See
 * camel_message_info_get_folder_flagged() for more information about
 * the use of this flag.
 * 
 * This is only a convenient wrapper around CAMEL_MESSAGE_FOLDER_FLAGGED flag,
 * for better readiness of the code.
 *
 * @param folderFlagged a value to set to
 * @return Whether the flag had been changed.
 */
- (bool)setFolderFlagged:(bool)folderFlagged;

/**
 * Sets From from the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param from a From to set
 * @return Whether the value changed.
 */
- (bool)setFrom:(OFString*)from;

/**
 * Sets encoded Message-ID of the associated message as a guint64 number,
 * partial MD5 sum. The value can be cast to #CamelSummaryMessageID.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param messageId a message id to set
 * @return Whether the value changed.
 */
- (bool)setMessageId:(guint64)messageId;

/**
 * Sets mesage list address from the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param mlist a message list address to set
 * @return Whether the value changed.
 */
- (bool)setMlist:(OFString*)mlist;

/**
 * Sets size of the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param size a size to set
 * @return Whether the value changed.
 */
- (bool)setSize:(guint32)size;

/**
 * Sets Subject from the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param subject a Subject to set
 * @return Whether the value changed.
 */
- (bool)setSubject:(OFString*)subject;

/**
 * Sets To from the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 *
 * @param to a To to set
 * @return Whether the value changed.
 */
- (bool)setTo:(OFString*)to;

/**
 * Changes UID of the @mi to @uid. If it changes, the 'dirty' flag
 * of the @mi is set too, unless the @mi is aborting notifications. This change
 * does not influence the 'folder-flagged' flag.
 *
 * @param uid a UID to set
 * @return Whether the UID changed.
 */
- (bool)setUid:(OFString*)uid;

/**
 * Change @state of the flag named @name. Unlike user tags, user flags
 * can only be set or unset, while the user tags can contain certain values.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is also emitted
 * folder's "changed" signal for this @mi, if necessary.
 *
 * @param name user flag name
 * @param state state to set for the flag
 * @return Whether the message info changed.
 */
- (bool)setUserFlagWithName:(OFString*)name state:(bool)state;

/**
 * Set user tag @name to @value, or remove it, if @value is %NULL.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is also emitted
 * folder's "changed" signal for this @mi, if necessary.
 *
 * @param name user tag name
 * @param value user tag value, or %NULL to remove the user tag
 * @return Whether the @mi changed.
 */
- (bool)setUserTagWithName:(OFString*)name value:(OFString*)value;

/**
 * Takes headers of the associated message.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 * 
 * Note that it's not safe to use the @headers after the call to this function,
 * because it can be freed due to no change.
 *
 * @param headers headers to set, as #CamelNameValueArray, or %NULL
 * @return Whether the value changed.
 */
- (bool)takeHeaders:(CamelNameValueArray*)headers;

/**
 * Takes encoded In-Reply-To and References headers of the associated message
 * as an array of guint64 numbers, partial MD5 sums. Each value can be
 * cast to #CamelSummaryMessageID.
 * 
 * This property is considered static, in a meaning that it should
 * not change during the life-time of the @mi, the same as it doesn't
 * change in the associated message.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is not emitted
 * folder's "changed" signal for this @mi.
 * 
 * Note that it's not safe to use the @references after the call to this function,
 * because it can be freed due to no change.
 *
 * @param references a references to set
 * @return Whether the value changed.
 */
- (bool)takeReferences:(GArray*)references;

/**
 * Takes all the @user_flags, which replaces any current user flags on the @mi.
 * The passed-in @user_flags is consumed by the @mi, which becomes an owner
 * of it. The caller should not change @user_flags afterwards.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is also emitted
 * folder's "changed" signal for this @mi, if necessary.
 * 
 * Note that it's not safe to use the @user_flags after the call to this function,
 * because it can be freed due to no change.
 *
 * @param userFlags user flags to set
 * @return Whether the message info changed.
 */
- (bool)takeUserFlags:(CamelNamedFlags*)userFlags;

/**
 * Takes all the @user_tags, which replaces any current user tags on the @mi.
 * The passed-in @user_tags is consumed by the @mi, which becomes an owner
 * of it. The caller should not change @user_tags afterwards.
 * 
 * If the @mi changed, the 'dirty' flag and the 'folder-flagged' flag are
 * set automatically, unless the @mi is aborting notifications. There is also emitted
 * folder's "changed" signal for this @mi, if necessary.
 * 
 * Note that it's not safe to use the @user_tags after the call to this function,
 * because it can be freed due to no change.
 *
 * @param userTags user tags to set
 * @return Whether the @mi changed.
 */
- (bool)takeUserTags:(CamelNameValueArray*)userTags;

/**
 * Reverses the call of the camel_message_info_freeze_notifications().
 * If this is the last freeze, then the associated folder is also notified
 * about the change, if any happened during the freeze.
 *
 */
- (void)thawNotifications;

@end