/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexName.h"

@implementation OGCamelIndexName

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_INDEX_NAME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (CamelIndexName*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelIndexName, CamelIndexName);
}

- (gsize)addBuffer:(OFString*)buffer len:(gsize)len
{
	gsize returnValue = (gsize)camel_index_name_add_buffer([self castedGObject], [buffer UTF8String], len);

	return returnValue;
}

- (void)addWord:(OFString*)word
{
	camel_index_name_add_word([self castedGObject], [word UTF8String]);
}


@end