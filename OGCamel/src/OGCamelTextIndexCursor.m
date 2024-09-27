/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTextIndexCursor.h"

@implementation OGCamelTextIndexCursor

- (CamelTextIndexCursor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelTextIndexCursor, CamelTextIndexCursor);
}


@end