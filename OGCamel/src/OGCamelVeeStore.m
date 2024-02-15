/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeStore.h"

#import "OGCamelVeeDataCache.h"
#import "OGCamelFolder.h"
#import "OGCamelVeeMessageInfoData.h"
#import <OGio/OGCancellable.h>
#import "OGCamelVeeFolder.h"

@implementation OGCamelVeeStore

- (instancetype)init
{
	CamelVeeStore* gobjectValue = CAMEL_VEE_STORE(camel_vee_store_new());

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
	return CAMEL_VEE_STORE([self gObject]);
}

- (bool)unmatchedEnabled
{
	bool returnValue = camel_vee_store_get_unmatched_enabled([self castedGObject]);

	return returnValue;
}

- (OGCamelVeeFolder*)unmatchedFolder
{
	CamelVeeFolder* gobjectValue = CAMEL_VEE_FOLDER(camel_vee_store_get_unmatched_folder([self castedGObject]));

	OGCamelVeeFolder* returnValue = [OGCamelVeeFolder withGObject:gobjectValue];
	return returnValue;
}

- (OGCamelVeeDataCache*)veeDataCache
{
	CamelVeeDataCache* gobjectValue = CAMEL_VEE_DATA_CACHE(camel_vee_store_get_vee_data_cache([self castedGObject]));

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