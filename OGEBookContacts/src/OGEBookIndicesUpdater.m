/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEBookIndicesUpdater.h"

@implementation OGEBookIndicesUpdater

+ (void)load
{
	GType gtypeToAssociate = E_TYPE_BOOK_INDICES_UPDATER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (EBookIndicesUpdater*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], EBookIndicesUpdater, EBookIndicesUpdater);
}

- (bool)addWithUid:(OFString*)uid indicesIndex:(guint)indicesIndex
{
	bool returnValue = (bool)e_book_indices_updater_add([self castedGObject], [uid UTF8String], indicesIndex);

	return returnValue;
}

- (const EBookIndices*)indices
{
	const EBookIndices* returnValue = (const EBookIndices*)e_book_indices_updater_get_indices([self castedGObject]);

	return returnValue;
}

- (bool)removeWithUid:(OFString*)uid
{
	bool returnValue = (bool)e_book_indices_updater_remove([self castedGObject], [uid UTF8String]);

	return returnValue;
}

- (bool)takeIndices:(EBookIndices*)indices
{
	bool returnValue = (bool)e_book_indices_updater_take_indices([self castedGObject], indices);

	return returnValue;
}


@end