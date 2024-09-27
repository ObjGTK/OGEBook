/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelVeeFolder.h"

@class OGCamelStore;
@class OGCamelFolder;

@interface OGCamelVTrashFolder : OGCamelVeeFolder
{

}


/**
 * Constructors
 */
- (instancetype)initWithParentStore:(OGCamelStore*)parentStore type:(CamelVTrashFolderType)type;

/**
 * Methods
 */

- (CamelVTrashFolder*)castedGObject;

/**
 *
 * @return a @vtrash_folder folder type (#CamelVTrashFolderType)
 */
- (CamelVTrashFolderType)folderType;

@end