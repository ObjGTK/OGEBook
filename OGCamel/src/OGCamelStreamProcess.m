/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamProcess.h"

@implementation OGCamelStreamProcess

- (instancetype)init
{
	CamelStreamProcess* gobjectValue = CAMEL_STREAM_PROCESS(camel_stream_process_new());

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

- (CamelStreamProcess*)castedGObject
{
	return CAMEL_STREAM_PROCESS([self gObject]);
}

- (gint)connectWithCommand:(OFString*)command env:(const gchar**)env
{
	GError* err = NULL;

	gint returnValue = camel_stream_process_connect([self castedGObject], [command UTF8String], env, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}


@end