/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVTrashFolder.h"

#import "OGCamelFolder.h"
#import "OGCamelStore.h"

@implementation OGCamelVTrashFolder

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_VTRASH_FOLDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithParentStore:(OGCamelStore*)parentStore type:(CamelVTrashFolderType)type
{
	CamelVTrashFolder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_vtrash_folder_new([parentStore castedGObject], type), CamelVTrashFolder, CamelVTrashFolder);

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

- (CamelVTrashFolder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelVTrashFolder, CamelVTrashFolder);
}

- (CamelVTrashFolderType)folderType
{
	CamelVTrashFolderType returnValue = (CamelVTrashFolderType)camel_vtrash_folder_get_folder_type([self castedGObject]);

	return returnValue;
}


@end