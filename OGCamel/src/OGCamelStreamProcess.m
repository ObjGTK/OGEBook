/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamProcess.h"

@implementation OGCamelStreamProcess

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_stream_process_new()];

	return self;
}

- (CamelStreamProcess*)STREAMPROCESS
{
	return CAMEL_STREAM_PROCESS([self GOBJECT]);
}

- (gint)connectWithCommand:(OFString*)command env:(const gchar**)env err:(GError**)err
{
	return camel_stream_process_connect([self STREAMPROCESS], [command UTF8String], env, err);
}


@end