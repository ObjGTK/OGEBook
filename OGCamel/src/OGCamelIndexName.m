/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexName.h"

@implementation OGCamelIndexName

- (CamelIndexName*)castedGObject
{
	return CAMEL_INDEX_NAME([self gObject]);
}

- (gsize)addBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	gsize returnValue = camel_index_name_add_buffer([self castedGObject], [buffer UTF8String], len);

	return returnValue;
}

- (void)addWord:(OFString*)word
{
	camel_index_name_add_word([self castedGObject], [word UTF8String]);
}


@end