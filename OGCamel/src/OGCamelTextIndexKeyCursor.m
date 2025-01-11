/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTextIndexKeyCursor.h"

@implementation OGCamelTextIndexKeyCursor

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_TEXT_INDEX_KEY_CURSOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelTextIndexKeyCursor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelTextIndexKeyCursor, CamelTextIndexKeyCursor);
}


@end