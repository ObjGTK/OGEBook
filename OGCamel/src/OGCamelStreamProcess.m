/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelStreamProcess.h"

@implementation OGCamelStreamProcess

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_STREAM_PROCESS;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	CamelStreamProcess* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_stream_process_new(), CamelStreamProcess, CamelStreamProcess);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelStreamProcess, CamelStreamProcess);
}

- (gint)connectWithCommand:(OFString*)command env:(const gchar**)env
{
	GError* err = NULL;

	gint returnValue = (gint)camel_stream_process_connect([self castedGObject], [command UTF8String], env, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end