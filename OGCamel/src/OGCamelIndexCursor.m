/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexCursor.h"

@implementation OGCamelIndexCursor

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_INDEX_CURSOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelIndexCursor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelIndexCursor, CamelIndexCursor);
}

- (OFString*)next
{
	const gchar* gobjectValue = camel_index_cursor_next([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end