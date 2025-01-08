/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilter.h"

@implementation OGCamelMimeFilter

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	CamelMimeFilter* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_new(), CamelMimeFilter, CamelMimeFilter);

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

- (CamelMimeFilter*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilter, CamelMimeFilter);
}

- (void)backupWithData:(OFString*)data length:(gsize)length
{
	camel_mime_filter_backup([self castedGObject], [data UTF8String], length);
}

- (void)completeWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_complete([self castedGObject], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (void)filterWithIn:(OFString*)in len:(gsize)len prespace:(gsize)prespace out:(gchar**)out outlen:(gsize*)outlen outprespace:(gsize*)outprespace
{
	camel_mime_filter_filter([self castedGObject], [in UTF8String], len, prespace, out, outlen, outprespace);
}

- (bool)requestStop
{
	bool returnValue = (bool)camel_mime_filter_get_request_stop([self castedGObject]);

	return returnValue;
}

- (void)reset
{
	camel_mime_filter_reset([self castedGObject]);
}

- (void)setRequestStop:(bool)requestStop
{
	camel_mime_filter_set_request_stop([self castedGObject], requestStop);
}

- (void)setSizeWithSize:(gsize)size keep:(gint)keep
{
	camel_mime_filter_set_size([self castedGObject], size, keep);
}


@end