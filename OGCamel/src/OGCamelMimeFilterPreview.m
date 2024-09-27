/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterPreview.h"

@implementation OGCamelMimeFilterPreview

- (instancetype)init:(guint)limit
{
	CamelMimeFilterPreview* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_preview_new(limit), CamelMimeFilterPreview, CamelMimeFilterPreview);

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

- (CamelMimeFilterPreview*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterPreview, CamelMimeFilterPreview);
}

- (guint)limit
{
	guint returnValue = camel_mime_filter_preview_get_limit([self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const gchar* gobjectValue = camel_mime_filter_preview_get_text([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setLimit:(guint)limit
{
	camel_mime_filter_preview_set_limit([self castedGObject], limit);
}


@end