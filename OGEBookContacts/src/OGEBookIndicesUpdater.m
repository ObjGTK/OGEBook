/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookIndicesUpdater.h"

@implementation OGEBookIndicesUpdater

- (EBookIndicesUpdater*)castedGObject
{
	return E_BOOK_INDICES_UPDATER([self gObject]);
}

- (bool)addWithUid:(OFString*)uid indicesIndex:(guint)indicesIndex
{
	bool returnValue = e_book_indices_updater_add([self castedGObject], [uid UTF8String], indicesIndex);

	return returnValue;
}

- (const EBookIndices*)indices
{
	const EBookIndices* returnValue = e_book_indices_updater_get_indices([self castedGObject]);

	return returnValue;
}

- (bool)remove:(OFString*)uid
{
	bool returnValue = e_book_indices_updater_remove([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)takeIndices:(EBookIndices*)indices
{
	bool returnValue = e_book_indices_updater_take_indices([self castedGObject], indices);

	return returnValue;
}


@end