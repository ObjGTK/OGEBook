/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelTextIndex.h"

@implementation OGCamelTextIndex

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_TEXT_INDEX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (gint)check:(OFString*)path
{
	gint returnValue = (gint)camel_text_index_check([path UTF8String]);

	return returnValue;
}

+ (gint)remove:(OFString*)old
{
	gint returnValue = (gint)camel_text_index_remove([old UTF8String]);

	return returnValue;
}

+ (gint)renameWithOld:(OFString*)old new:(OFString*)new
{
	gint returnValue = (gint)camel_text_index_rename([old UTF8String], [new UTF8String]);

	return returnValue;
}

- (instancetype)initWithPath:(OFString*)path flags:(gint)flags
{
	CamelTextIndex* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_text_index_new([path UTF8String], flags), CamelTextIndex, CamelTextIndex);

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

- (CamelTextIndex*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelTextIndex, CamelTextIndex);
}

- (void)dump
{
	camel_text_index_dump([self castedGObject]);
}

- (void)info
{
	camel_text_index_info([self castedGObject]);
}

- (void)validate
{
	camel_text_index_validate([self castedGObject]);
}


@end