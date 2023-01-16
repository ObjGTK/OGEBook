/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeStore.h"

#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeDataCache.h"
#import "OGCamelVeeFolder.h"
#import "OGCamelFolder.h"

@implementation OGCamelVeeStore

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_vee_store_new()];

	return self;
}

- (CamelVeeStore*)VEESTORE
{
	return CAMEL_VEE_STORE([self GOBJECT]);
}

- (bool)unmatchedEnabled
{
	return camel_vee_store_get_unmatched_enabled([self VEESTORE]);
}

- (OGCamelVeeFolder*)unmatchedFolder
{
	return [[[OGCamelVeeFolder alloc] initWithGObject:(GObject*)camel_vee_store_get_unmatched_folder([self VEESTORE])] autorelease];
}

- (OGCamelVeeDataCache*)veeDataCache
{
	return [[[OGCamelVeeDataCache alloc] initWithGObject:(GObject*)camel_vee_store_get_vee_data_cache([self VEESTORE])] autorelease];
}

- (void)noteSubfolderUnusedWithSubfolder:(OGCamelFolder*)subfolder unusedBy:(OGCamelVeeFolder*)unusedBy
{
	camel_vee_store_note_subfolder_unused([self VEESTORE], [subfolder FOLDER], [unusedBy VEEFOLDER]);
}

- (void)noteSubfolderUsedWithSubfolder:(OGCamelFolder*)subfolder usedBy:(OGCamelVeeFolder*)usedBy
{
	camel_vee_store_note_subfolder_used([self VEESTORE], [subfolder FOLDER], [usedBy VEEFOLDER]);
}

- (void)noteVuidUnusedWithMiData:(OGCamelVeeMessageInfoData*)miData unusedBy:(OGCamelVeeFolder*)unusedBy
{
	camel_vee_store_note_vuid_unused([self VEESTORE], [miData VEEMESSAGEINFODATA], [unusedBy VEEFOLDER]);
}

- (void)noteVuidUsedWithMiData:(OGCamelVeeMessageInfoData*)miData usedBy:(OGCamelVeeFolder*)usedBy
{
	camel_vee_store_note_vuid_used([self VEESTORE], [miData VEEMESSAGEINFODATA], [usedBy VEEFOLDER]);
}

- (void)rebuildUnmatchedFolderWithCancellable:(GCancellable*)cancellable err:(GError**)err
{
	camel_vee_store_rebuild_unmatched_folder([self VEESTORE], cancellable, err);
}

- (void)setUnmatchedEnabled:(bool)isEnabled
{
	camel_vee_store_set_unmatched_enabled([self VEESTORE], isEnabled);
}


@end