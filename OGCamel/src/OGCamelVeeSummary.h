/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelFolderSummary.h"

@class OGCamelFolder;
@class OGCamelVeeMessageInfo;
@class OGCamelVeeMessageInfoData;

@interface OGCamelVeeSummary : OGCamelFolderSummary
{

}


/**
 * Constructors
 */
+ (instancetype)veeSummaryWithParent:(OGCamelFolder*)parent;

/**
 * Methods
 */

- (CamelVeeSummary*)castedGObject;

/**
 * Unref returned pointer with g_object_unref()
 *
 * @param miData the #CamelVeeMessageInfoData to add
 * @return A new #CamelVeeMessageInfo object.
 */
- (OGCamelVeeMessageInfo*)addWithMiData:(OGCamelVeeMessageInfoData*)miData;

/**
 * Returns a hash table of all virtual message info UID-s known to the @summary.
 * The key of the hash table is the virtual message info UID, the value is
 * only the number 1.
 *
 * @param subfolder a #CamelFolder
 * @return a #GHashTable with
 *    all the virtual mesasge info UID-s knwn to the @summary.
 */
- (GHashTable*)uidsForSubfolder:(OGCamelFolder*)subfolder;

/**
 * Removes the given @vuid of the @subfolder from the @summary.
 *
 * @param vuid a virtual message info UID to remove
 * @param subfolder a #CamelFolder to which @vuid belongs
 */
- (void)removeWithVuid:(OFString*)vuid subfolder:(OGCamelFolder*)subfolder;

/**
 * Makes sure @summary flags on @uid corresponds to those
 * in the subfolder of vee-folder, and updates internal counts
 * on @summary as well.
 *
 * @param uid a message UID to update flags for
 */
- (void)replaceFlagsWithUid:(OFString*)uid;

@end