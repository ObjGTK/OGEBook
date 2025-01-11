/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolder.h"

@class OGCamelStore;
@class OGCamelVeeMessageInfoData;
@class OGCancellable;

@interface OGCamelVeeFolder : OGCamelFolder
{

}


/**
 * Constructors
 */
+ (instancetype)veeFolderWithParentStore:(OGCamelStore*)parentStore full:(OFString*)full flags:(guint32)flags;

/**
 * Methods
 */

- (CamelVeeFolder*)castedGObject;

/**
 * Adds @subfolder as a source folder to @vfolder.
 *
 * @param subfolder source CamelFolder to add to @vfolder
 * @param cancellable optional #GCancellable object, or %NULL
 */
- (void)addFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable;

/**
 * Adds the @mi_data to the @vfolder. The @changes can be
 * updated with the made change and later used to notify others
 * with camel_folder_changed() on the @vfolder. This can be used
 * only for the Unmatched folder.
 *
 * @param miData a #CamelVeeMessageInfoData to add
 * @param changes an optional #CamelFolderChangeInfo to update with the made change, or %NULL
 */
- (void)addVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes;

/**
 * Initializes internal structures of the @vf. This is meant to be
 * called by the descendants of #CamelVeeFolder.
 *
 * @param flags flags for the @vf
 */
- (void)construct:(guint32)flags;

/**
 *
 * @return whether the @vfolder can automatically update when any
 *    of its subfolders changes.
 */
- (bool)autoUpdate;

/**
 *
 * @return a SExp expression used for this @vfolder
 */
- (OFString*)expression;

/**
 *
 * @return flags of @vf, as set by camel_vee_folder_construct()
 */
- (guint32)flags;

/**
 * Find the real folder (and message info UID) for the given @vinfo.
 * When the @realuid is not %NULL and it's set, then use g_free() to
 * free it, when no longer needed.
 *
 * @param vinfo a #CamelVeeMessageInfo to search for
 * @param realuid if not %NULL, set to the UID of the real message info
 * @return a real (not virtual) #CamelFolder, which the @vinfo is for.
 */
- (OGCamelFolder*)locationWithVinfo:(const CamelVeeMessageInfo*)vinfo realuid:(gchar**)realuid;

/**
 *
 * @param veeMessageUid a virtual message info UID
 * @return a #CamelFolder to which the @vee_message_uid
 *    belongs, or %NULL, when it could not be found.
 */
- (OGCamelFolder*)veeUidFolder:(OFString*)veeMessageUid;

/**
 * The next @subfolder-'s 'changed' event will be silently ignored. This
 * is usually used in virtual folders when the change was done in them,
 * but it is neither vTrash nor vJunk folder. Doing this avoids unnecessary
 * removals of messages which don't satisfy search criteria anymore,
 * which could be done on asynchronous delivery of folder's 'changed' signal.
 * These ignored changes are accumulated and used on folder refresh.
 *
 * @param subfolder a #CamelFolder folder
 */
- (void)ignoreNextChangedEvent:(OGCamelFolder*)subfolder;

/**
 * Propagate any skipped changes into the @vf. The skipped changes are used to not
 * hide the messages from the search folder unexpectedly. The function does nothing
 * when there are no changes to be propagated.
 *
 */
- (void)propagateSkippedChanges;

/**
 * Rebuild the folder @subfolder, if it should be.
 *
 * @param subfolder source CamelFolder to add to @vfolder
 * @param cancellable optional #GCancellable object, or %NULL
 */
- (void)rebuildFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable;

/**
 * Returns a #GList of all folders of this @vfolder, which
 * are used to populate it. These are in no particular order.
 * 
 * Free the returned #GList with
 * g_list_free_full (folders, g_object_unref);
 * when no longer needed.
 *
 * @return a #GList of all
 *    folders of this @vfolder.
 */
- (GList*)refFolders;

/**
 * Removed the source folder, @subfolder, from the virtual folder, @vfolder.
 *
 * @param subfolder source CamelFolder to remove from @vfolder
 * @param cancellable optional #GCancellable object, or %NULL
 */
- (void)removeFolderWithSubfolder:(OGCamelFolder*)subfolder cancellable:(OGCancellable*)cancellable;

/**
 * Make sure the next @subfolder-'s 'changed' event will not be silently ignored.
 * This is a counter-part function of camel_vee_folder_ignore_next_changed_event(),
 * when there was expected a change, which did not happen, to take back the previous
 * ignore event request.
 *
 * @param subfolder a #CamelFolder folder
 */
- (void)removeFromIgnoreChangedEvent:(OGCamelFolder*)subfolder;

/**
 * Removes given @mi_data from the @vfolder. The @changes can be
 * updated with the made change and later used to notify others
 * with camel_folder_changed() on the @vfolder. This can be used
 * only for the Unmatched folder.
 *
 * @param miData a #CamelVeeMessageInfoData to remove
 * @param changes an optional #CamelFolderChangeInfo to update with the made change, or %NULL
 */
- (void)removeVuidWithMiData:(OGCamelVeeMessageInfoData*)miData changes:(CamelFolderChangeInfo*)changes;

/**
 * Sets whether the @vfolder can automatically update when of its
 * subfolders changes.
 *
 * @param autoUpdate a value to set
 */
- (void)setAutoUpdate:(bool)autoUpdate;

/**
 * Sets an SExp expression to be used for this @vfolder
 *
 * @param expression an SExp expression to set
 */
- (void)setExpression:(OFString*)expression;

/**
 * Set the whole list of folder sources on a vee folder.
 *
 * @param folders a #GList of #CamelFolder to add
 * @param cancellable optional #GCancellable object, or %NULL
 */
- (void)setFoldersWithFolders:(GList*)folders cancellable:(OGCancellable*)cancellable;

@end