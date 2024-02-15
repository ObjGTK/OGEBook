/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStore.h"

@class OGCamelVeeDataCache;
@class OGCamelFolder;
@class OGCamelVeeMessageInfoData;
@class OGCancellable;
@class OGCamelVeeFolder;

@interface OGCamelVeeStore : OGCamelStore
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (CamelVeeStore*)castedGObject;

/**
 *
 * @return whether Unmatched folder processing is enabled
 */
- (bool)unmatchedEnabled;

/**
 *
 * @return the Unmatched folder instance,
 *    or %NULL, when it's disabled.
 */
- (OGCamelVeeFolder*)unmatchedFolder;

/**
 *
 * @return the associated #CamelVeeDataCache
 */
- (OGCamelVeeDataCache*)veeDataCache;

/**
 * This is a counter part of camel_vee_store_note_subfolder_used(). Once
 * the @subfolder is claimed to be not used by all folders its message infos
 * are removed from the Unmatched folder.
 *
 * @param subfolder a #CamelFolder
 * @param unusedBy a #CamelVeeFolder
 */
- (void)noteSubfolderUnusedWithSubfolder:(OGCamelFolder*)subfolder unusedBy:(OGCamelVeeFolder*)unusedBy;

/**
 * Notes that the @subfolder is used by @used_by folder, which
 * is used to determine what folders will be included in
 * the Unmatched folders.
 *
 * @param subfolder a #CamelFolder
 * @param usedBy a #CamelVeeFolder
 */
- (void)noteSubfolderUsedWithSubfolder:(OGCamelFolder*)subfolder usedBy:(OGCamelVeeFolder*)usedBy;

/**
 * A counter part of camel_vee_store_note_vuid_used(). Once the @unused_by
 * claims the @mi_data is not used by it anymore, and neither any other
 * virtual folder is using it, then the Unmatched folder will have it added.
 *
 * @param miData a #CamelVeeMessageInfoData
 * @param unusedBy a #CamelVeeFolder
 */
- (void)noteVuidUnusedWithMiData:(OGCamelVeeMessageInfoData*)miData unusedBy:(OGCamelVeeFolder*)unusedBy;

/**
 * Notes the @mi_data is used by the @used_by virtual folder, which
 * removes it from the Unmatched folder, if not used anywhere else.
 *
 * @param miData a #CamelVeeMessageInfoData
 * @param usedBy a #CamelVeeFolder
 */
- (void)noteVuidUsedWithMiData:(OGCamelVeeMessageInfoData*)miData usedBy:(OGCamelVeeFolder*)usedBy;

/**
 * Let's the @vstore know to rebuild the Unmatched folder. This is done
 * as a separate job, when the @cancellable is %NULL, otherwise it's run
 * synchronously.
 *
 * @param cancellable optional #GCancellable object, or %NULL
 */
- (void)rebuildUnmatchedFolder:(OGCancellable*)cancellable;

/**
 * Sets whether the Unmatched folder processing is enabled.
 *
 * @param isEnabled value to set
 */
- (void)setUnmatchedEnabled:(bool)isEnabled;

@end