/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelKeyFile.h"

@implementation OGCamelKeyFile

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_KEY_FILE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithPath:(OFString*)path flags:(gint)flags version:(OFString*)version
{
	CamelKeyFile* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_key_file_new([path UTF8String], flags, [version UTF8String]), CamelKeyFile, CamelKeyFile);

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (CamelKeyFile*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelKeyFile, CamelKeyFile);
}

- (gint)delete
{
	gint returnValue = (gint)camel_key_file_delete([self castedGObject]);

	return returnValue;
}

- (gint)readWithStart:(camel_block_t*)start len:(gsize*)len records:(camel_key_t**)records
{
	gint returnValue = (gint)camel_key_file_read([self castedGObject], start, len, records);

	return returnValue;
}

- (gint)rename:(OFString*)path
{
	gint returnValue = (gint)camel_key_file_rename([self castedGObject], [path UTF8String]);

	return returnValue;
}

- (gint)writeWithParent:(camel_block_t*)parent len:(gsize)len records:(camel_key_t*)records
{
	gint returnValue = (gint)camel_key_file_write([self castedGObject], parent, len, records);

	return returnValue;
}


@end