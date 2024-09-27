/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFs.h"

@implementation OGCamelStreamFs

- (instancetype)initWithFd:(gint)fd
{
	CamelStreamFs* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_fs_new_with_fd(fd), CamelStreamFs, CamelStreamFs);

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

- (instancetype)initWithNameWithName:(OFString*)name flags:(gint)flags mode:(mode_t)mode
{
	GError* err = NULL;

	CamelStreamFs* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_fs_new_with_name([name UTF8String], flags, mode, &err), CamelStreamFs, CamelStreamFs);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (CamelStreamFs*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamFs, CamelStreamFs);
}

- (gint)fd
{
	gint returnValue = camel_stream_fs_get_fd([self castedGObject]);

	return returnValue;
}


@end