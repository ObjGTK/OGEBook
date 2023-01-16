/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterLinewrap.h"

@implementation OGCamelMimeFilterLinewrap

- (instancetype)initWithPreferredLen:(guint)preferredLen maxLen:(guint)maxLen indentChar:(gchar)indentChar flags:(guint32)flags
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_linewrap_new(preferredLen, maxLen, indentChar, flags)];

	return self;
}

- (CamelMimeFilterLinewrap*)MIMEFILTERLINEWRAP
{
	return CAMEL_MIME_FILTER_LINEWRAP([self GOBJECT]);
}


@end