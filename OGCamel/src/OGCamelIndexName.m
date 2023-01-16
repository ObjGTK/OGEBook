/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndexName.h"

@implementation OGCamelIndexName

- (CamelIndexName*)INDEXNAME
{
	return CAMEL_INDEX_NAME([self GOBJECT]);
}

- (gsize)addBufferWithBuffer:(OFString*)buffer len:(gsize)len
{
	return camel_index_name_add_buffer([self INDEXNAME], [buffer UTF8String], len);
}

- (void)addWord:(OFString*)word
{
	camel_index_name_add_word([self INDEXNAME], [word UTF8String]);
}


@end