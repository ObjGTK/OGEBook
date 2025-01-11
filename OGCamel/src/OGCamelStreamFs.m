/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFs.h"

@implementation OGCamelStreamFs

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_FS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)streamFsWithFd:(gint)fd
{
	CamelStreamFs* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_fs_new_with_fd(fd), CamelStreamFs, CamelStreamFs);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelStreamFs* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamFs alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)streamFsWithNameWithName:(OFString*)name flags:(gint)flags mode:(mode_t)mode
{
	GError* err = NULL;

	CamelStreamFs* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_fs_new_with_name([name UTF8String], flags, mode, &err), CamelStreamFs, CamelStreamFs);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelStreamFs* wrapperObject;
	@try {
		wrapperObject = [[OGCamelStreamFs alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelStreamFs*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamFs, CamelStreamFs);
}

- (gint)fd
{
	gint returnValue = (gint)camel_stream_fs_get_fd([self castedGObject]);

	return returnValue;
}


@end