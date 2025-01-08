/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeStore.h"

#import "OGCamelFolder.h"
#import "OGCamelVeeDataCache.h"
#import "OGCamelVeeFolder.h"
#import "OGCamelVeeMessageInfoData.h"
#import <OGio/OGCancellable.h>

@implementation OGCamelVeeStore

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VEE_STORE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

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
	bool returnValue = (bool)camel_vee_store_get_unmatched_enabled([self castedGObject]);

	return returnValue;
}

- (OGCamelVeeFolder*)unmatchedFolder
{
	CamelVeeFolder* gobjectValue = camel_vee_store_get_unmatched_folder([self castedGObject]);

	OGCamelVeeFolder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGCamelVeeDataCache*)veeDataCache
{
	CamelVeeDataCache* gobjectValue = camel_vee_store_get_vee_data_cache([self castedGObject]);

	OGCamelVeeDataCache* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
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

	[OGErrorException throwForError:err];

}

- (void)setUnmatchedEnabled:(bool)isEnabled
{
	camel_vee_store_set_unmatched_enabled([self castedGObject], isEnabled);
}


@end