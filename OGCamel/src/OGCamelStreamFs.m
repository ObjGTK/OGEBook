/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamFs.h"

@implementation OGCamelStreamFs

- (instancetype)initWithFd:(gint)fd
{
	CamelStreamFs* gobjectValue = CAMEL_STREAM_FS(camel_stream_fs_new_with_fd(fd));

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

	CamelStreamFs* gobjectValue = CAMEL_STREAM_FS(camel_stream_fs_new_with_name([name UTF8String], flags, mode, &err));

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
	return CAMEL_STREAM_FS([self gObject]);
}

- (gint)fd
{
	gint returnValue = camel_stream_fs_get_fd([self castedGObject]);

	return returnValue;
}


@end