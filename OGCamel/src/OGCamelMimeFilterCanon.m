/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCanon.h"

@implementation OGCamelMimeFilterCanon

- (instancetype)init:(guint32)flags
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_canon_new(flags)];

	return self;
}

- (CamelMimeFilterCanon*)MIMEFILTERCANON
{
	return CAMEL_MIME_FILTER_CANON([self GOBJECT]);
}


@end