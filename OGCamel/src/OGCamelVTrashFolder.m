/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVTrashFolder.h"

#import "OGCamelFolder.h"
#import "OGCamelStore.h"

@implementation OGCamelVTrashFolder

- (instancetype)initWithParentStore:(OGCamelStore*)parentStore type:(CamelVTrashFolderType)type
{
	self = [super initWithGObject:(GObject*)camel_vtrash_folder_new([parentStore STORE], type)];

	return self;
}

- (CamelVTrashFolder*)VTRASHFOLDER
{
	return CAMEL_VTRASH_FOLDER([self GOBJECT]);
}

- (CamelVTrashFolderType)folderType
{
	return camel_vtrash_folder_get_folder_type([self VTRASHFOLDER]);
}


@end