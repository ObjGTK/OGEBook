/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeStore.h"

#import "OGCamelVeeDataCache.h"
#import "OGCamelVeeMessageInfoData.h"
#import "OGCamelVeeFolder.h"
#import <OGio/OGCancellable.h>
#import "OGCamelFolder.h"

@implementation OGCamelVeeStore

- (instancetype)init
{
	CamelVeeStore* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_store_new(), CamelVeeStore, CamelVeeStore);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelVeeStore*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVeeStore, CamelVeeStore);
}

- (bool)unmatchedEnabled
{
	bool returnValue = camel_vee_store_get_unmatched_enabled([self castedGObject]);

	return returnValue;
}

- (OGCamelVeeFolder*)unmatchedFolder
{
	CamelVeeFolder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_store_get_unmatched_folder([self castedGObject]), CamelVeeFolder, CamelVeeFolder);

	OGCamelVeeFolder* returnValue = [OGCamelVeeFolder withGObject:gobjectValue];
	return returnValue;
}

- (OGCamelVeeDataCache*)veeDataCache
{
	CamelVeeDataCache* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vee_store_get_vee_data_cache([self castedGObject]), CamelVeeDataCache, CamelVeeDataCache);

	OGCamelVeeDataCache* returnValue = [OGCamelVeeDataCache withGObject:gobjectValue];
	return returnValue;
}

- (void)noteSubfolderUnusedWithSubfolder:(OGCamelFolder*)subfolder unusedBy:(OGCamelVeeFolder*)unusedBy
{
	camel_vee_store_note_subfolder_unused([self castedGObject], [subfolder castedGObject], [unusedBy castedGObject]);
}

- (void)noteSubfolderUsedWithSubfolder:(OGCamelFolder*)subfolder usedBy:(OGCamelVeeFolder*)usedBy
{
	camel_vee_store_note_subfolder_used([self castedGObject], [subfolder castedGObject], [usedBy castedGObject]);
}

- (void)noteVuidUnusedWithMiData:(OGCamelVeeMessageInfoData*)miData unusedBy:(OGCamelVeeFolder*)unusedBy
{
	camel_vee_store_note_vuid_unused([self castedGObject], [miData castedGObject], [unusedBy castedGObject]);
}

- (void)noteVuidUsedWithMiData:(OGCamelVeeMessageInfoData*)miData usedBy:(OGCamelVeeFolder*)usedBy
{
	camel_vee_store_note_vuid_used([self castedGObject], [miData castedGObject], [usedBy castedGObject]);
}

- (void)rebuildUnmatchedFolder:(OGCancellable*)cancellable
{
	GError* err = NULL;

	camel_vee_store_rebuild_unmatched_folder([self castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

}

- (void)setUnmatchedEnabled:(bool)isEnabled
{
	camel_vee_store_set_unmatched_enabled([self castedGObject], isEnabled);
}


@end