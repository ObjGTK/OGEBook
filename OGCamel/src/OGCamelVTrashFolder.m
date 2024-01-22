/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVTrashFolder.h"

#import "OGCamelFolder.h"
#import "OGCamelStore.h"

@implementation OGCamelVTrashFolder

- (instancetype)initWithParentStore:(OGCamelStore*)parentStore type:(CamelVTrashFolderType)type
{
	CamelVTrashFolder* gobjectValue = CAMEL_VTRASH_FOLDER(camel_vtrash_folder_new([parentStore castedGObject], type));

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
	return CAMEL_VTRASH_FOLDER([self gObject]);
}

- (CamelVTrashFolderType)folderType
{
	CamelVTrashFolderType returnValue = camel_vtrash_folder_get_folder_type([self castedGObject]);

	return returnValue;
}


@end