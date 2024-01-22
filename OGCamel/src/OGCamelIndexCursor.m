/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexCursor.h"

@implementation OGCamelIndexCursor

- (CamelIndexCursor*)castedGObject
{
	return CAMEL_INDEX_CURSOR([self gObject]);
}

- (OFString*)next
{
	const gchar* gobjectValue = camel_index_cursor_next([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end