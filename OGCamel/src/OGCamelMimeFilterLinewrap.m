/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterLinewrap.h"

@implementation OGCamelMimeFilterLinewrap

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_LINEWRAP;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithPreferredLen:(guint)preferredLen maxLen:(guint)maxLen indentChar:(gchar)indentChar flags:(guint32)flags
{
	CamelMimeFilterLinewrap* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_linewrap_new(preferredLen, maxLen, indentChar, flags), CamelMimeFilterLinewrap, CamelMimeFilterLinewrap);

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

- (CamelMimeFilterLinewrap*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterLinewrap, CamelMimeFilterLinewrap);
}


@end