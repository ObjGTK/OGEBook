/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexCursor.h"

@implementation OGCamelIndexCursor

- (CamelIndexCursor*)INDEXCURSOR
{
	return CAMEL_INDEX_CURSOR([self GOBJECT]);
}

- (OFString*)next
{
	return [OFString stringWithUTF8String:camel_index_cursor_next([self INDEXCURSOR])];
}


@end