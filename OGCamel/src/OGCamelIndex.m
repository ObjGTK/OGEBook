/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelIndex.h"

#import "OGCamelIndexName.h"
#import "OGCamelIndexCursor.h"

@implementation OGCamelIndex

- (CamelIndex*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelIndex, CamelIndex);
}

- (OGCamelIndexName*)addName:(OFString*)name
{
	CamelIndexName* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_index_add_name([self castedGObject], [name UTF8String]), CamelIndexName, CamelIndexName);

	OGCamelIndexName* returnValue = [OGCamelIndexName withGObject:gobjectValue];
	return returnValue;
}

- (gint)compress
{
	gint returnValue = camel_index_compress([self castedGObject]);

	return returnValue;
}

- (void)constructWithPath:(OFString*)path flags:(gint)flags
{
	camel_index_construct([self castedGObject], [path UTF8String], flags);
}

- (gint)delete
{
	gint returnValue = camel_index_delete([self castedGObject]);

	return returnValue;
}

- (void)deleteName:(OFString*)name
{
	camel_index_delete_name([self castedGObject], [name UTF8String]);
}

- (OGCamelIndexCursor*)find:(OFString*)word
{
	CamelIndexCursor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_index_find([self castedGObject], [word UTF8String]), CamelIndexCursor, CamelIndexCursor);

	OGCamelIndexCursor* returnValue = [OGCamelIndexCursor withGObject:gobjectValue];
	return returnValue;
}

- (OGCamelIndexCursor*)findName:(OFString*)name
{
	CamelIndexCursor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_index_find_name([self castedGObject], [name UTF8String]), CamelIndexCursor, CamelIndexCursor);

	OGCamelIndexCursor* returnValue = [OGCamelIndexCursor withGObject:gobjectValue];
	return returnValue;
}

- (gint)hasName:(OFString*)name
{
	gint returnValue = camel_index_has_name([self castedGObject], [name UTF8String]);

	return returnValue;
}

- (gint)rename:(OFString*)path
{
	gint returnValue = camel_index_rename([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (void)setNormalizeWithFunc:(CamelIndexNorm)func userData:(gpointer)userData
{
	camel_index_set_normalize([self castedGObject], func, userData);
}

- (gint)sync
{
	gint returnValue = camel_index_sync([self castedGObject]);

	return returnValue;
}

- (OGCamelIndexCursor*)words
{
	CamelIndexCursor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_index_words([self castedGObject]), CamelIndexCursor, CamelIndexCursor);

	OGCamelIndexCursor* returnValue = [OGCamelIndexCursor withGObject:gobjectValue];
	return returnValue;
}

- (gint)writeName:(OGCamelIndexName*)idn
{
	gint returnValue = camel_index_write_name([self castedGObject], [idn castedGObject]);

	return returnValue;
}


@end