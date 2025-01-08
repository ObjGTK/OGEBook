/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelFolderSummary;

@interface OGCamelStoreSummary : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelStoreSummary*)castedGObject;

/**
 * The @info record should have been generated by calling one of the
 * info_new_*() functions, as it will be free'd based on the summary
 * class.  And MUST NOT be allocated directly using malloc.
 *
 * @param info a #CamelStoreInfo
 */
- (void)add:(CamelStoreInfo*)info;

/**
 * Build a new info record based on the name, and add it to the summary.
 *
 * @param path item path
 * @return the newly added record or %NULL if the @path already exists
 */
- (CamelStoreInfo*)addFromPath:(OFString*)path;

/**
 * Obtain a copy of the summary array.  This is done atomically,
 * so cannot contain empty entries.
 * 
 * It must be freed using g_ptr_array_unref().
 *
 * @return the summary array
 */
- (GPtrArray*)array;

/**
 * Free the folder summary array.
 *
 * @param array the summary array as gotten from
 * camel_store_summary_array()
 */
- (void)arrayFree:(GPtrArray*)array;

/**
 * Connects listeners for count changes on @folder_summary to keep
 * CamelStoreInfo.total and CamelStoreInfo.unread in sync transparently.
 * The @folder_summary is stored in @summary as @path. Use
 * camel_store_summary_disconnect_folder_summary() to disconnect from
 * listening.
 *
 * @param path used path for @folder_summary
 * @param folderSummary a #CamelFolderSummary object
 * @return Whether successfully connect callbacks for count change
 * notifications.
 */
- (bool)connectFolderSummaryWithPath:(OFString*)path folderSummary:(OGCamelFolderSummary*)folderSummary;

/**
 * Get the number of summary items stored in this summary.
 *
 * @return the number of items gint he summary.
 */
- (gint)count;

/**
 * Diconnects count change listeners previously connected
 * by camel_store_summary_connect_folder_summary().
 *
 * @param folderSummary a #CamelFolderSummary object
 * @return Whether such connection existed and whether was successfully
 * removed.
 */
- (bool)disconnectFolderSummary:(OGCamelFolderSummary*)folderSummary;

/**
 * Allocate a new #CamelStoreInfo, suitable for adding to this
 * summary.
 *
 * @return the newly allocated #CamelStoreInfo
 */
- (CamelStoreInfo*)infoNew;

/**
 * Add an extra reference to @info.
 *
 * @param info a #CamelStoreInfo
 * @return the @info argument
 */
- (CamelStoreInfo*)infoRef:(CamelStoreInfo*)info;

/**
 * Unref and potentially free @info, and all associated memory.
 *
 * @param info a #CamelStoreInfo
 */
- (void)infoUnref:(CamelStoreInfo*)info;

/**
 * Load the summary off disk.
 *
 * @return 0 on success or -1 on fail
 */
- (gint)load;

/**
 * Retrieve a summary item by path name.
 * 
 * The returned #CamelStoreInfo is referenced for thread-safety and should be
 * unreferenced with camel_store_info_unref() when finished with it.
 *
 * @param path path to the item
 * @return the summary item, or %NULL if the @path name is not
 * available
 */
- (CamelStoreInfo*)path:(OFString*)path;

/**
 * Remove a specific @info record from the summary.
 *
 * @param info a #CamelStoreInfo
 */
- (void)remove:(CamelStoreInfo*)info;

/**
 * Remove a specific info record from the summary, by @path.
 *
 * @param path item path
 */
- (void)removePath:(OFString*)path;

/**
 * Writes the summary to disk.  The summary is only written if changes
 * have occurred.
 *
 * @return 0 on success or -1 on fail
 */
- (gint)save;

/**
 * Set the filename where the summary will be loaded to/saved from.
 *
 * @param filename a filename
 */
- (void)setFilename:(OFString*)filename;

/**
 * Sorts the array of the folders using the @compare_func.
 *
 * @param compareFunc a compare function
 * @param userData user data passed to the @compare_func
 */
- (void)sortWithCompareFunc:(GCompareDataFunc)compareFunc userData:(gpointer)userData;

/**
 * Mark the summary as changed, so that a save will force it to be
 * written back to disk.
 *
 */
- (void)touch;

@end