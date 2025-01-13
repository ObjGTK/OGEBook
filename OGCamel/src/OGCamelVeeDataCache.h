/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelFolder;
@class OGCamelVeeMessageInfoData;
@class OGCamelVeeSubfolderData;

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGCamelVeeDataCache : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)veeDataCache;

/**
 * Methods
 */

- (CamelVeeDataCache*)castedGObject;

/**
 * Adds the @subfolder to the @data_cache to be tracked by it. The @subfolder
 * is referenced for later use. The function does nothing when the @subfolder
 * is already in the @data_cache. The subfolders can be removed with
 * camel_vee_data_cache_remove_subfolder().
 *
 * @param subfolder a #CamelFolder
 */
- (void)addSubfolder:(OGCamelFolder*)subfolder;

/**
 * Returns whether data_cache contains given @orig_message_uid for the given @folder.
 * Unlike camel_vee_data_cache_get_message_info_data(), this only
 * returns %FALSE if not, while camel_vee_data_cache_get_message_info_data()
 * auto-adds it to data_cache.
 *
 * @param folder a #CamelFolder to which the @orig_message_uid belongs
 * @param origMessageUid a message UID from the @folder to check
 * @return
 */
- (bool)containsMessageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid;

/**
 * Calls the @func for each message info data from the given @fromfolder
 *
 * @param fromfolder a #CamelFolder
 * @param func a #CamelForeachInfoData function to call
 * @param userData user data to pass to the @func
 */
- (void)foreachMessageInfoDataWithFromfolder:(OGCamelFolder*)fromfolder func:(CamelForeachInfoData)func userData:(gpointer)userData;

/**
 * Returns a referenced #CamelVeeMessageInfoData referencing the given @folder
 * and @orig_message_uid. If it's not part of the @data_cache, then it is
 * created and auto-added. Use camel_vee_data_cache_contains_message_info_data()
 * when you only want to check the existence, without adding it to the @data_cache.
 *
 * @param folder a #CamelFolder to which the @orig_message_uid belongs
 * @param origMessageUid a message UID from the @folder to return
 * @return a referenced #CamelVeeMessageInfoData; unref it
 *    with g_object_unref(), when no longer needed.
 */
- (OGCamelVeeMessageInfoData*)messageInfoDataWithFolder:(OGCamelFolder*)folder origMessageUid:(OFString*)origMessageUid;

/**
 *
 * @param veeMessageUid a message UID in the virtual folder
 * @return a referenced #CamelVeeMessageInfoData,
 *    which corresponds to the given @vee_message_uid, or %NULL, when no such
 *    message info with that virtual UID exists. Unref it with g_object_unref(),
 *    when no longer needed.
 */
- (OGCamelVeeMessageInfoData*)messageInfoDataByVuidWithVeeMessageUid:(OFString*)veeMessageUid;

/**
 * Returns a #CamelVeeSubfolderData for the given @folder.
 *
 * @param folder a #CamelFolder for which to return subfolder data
 * @return a referenced #CamelVeeSubfolderData; unref it
 *    with g_object_unref(), when no longer needed.
 */
- (OGCamelVeeSubfolderData*)subfolderData:(OGCamelFolder*)folder;

/**
 * Removes given @mi_data from the @data_cache.
 *
 * @param miData a #CamelVeeMessageInfoData to remove
 */
- (void)removeMessageInfoDataWithMiData:(OGCamelVeeMessageInfoData*)miData;

/**
 * Removes given @subfolder from the @data_cache, which had been
 * previously added with camel_vee_data_cache_add_subfolder().
 * The function does nothing, when the @subfolder is not part
 * of the @data_cache.
 *
 * @param subfolder a #CamelFolder to remove
 */
- (void)removeSubfolder:(OGCamelFolder*)subfolder;

@end