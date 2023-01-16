/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterEnriched.h"

@implementation OGCamelMimeFilterEnriched

- (instancetype)init:(guint32)flags
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_enriched_new(flags)];

	return self;
}

- (CamelMimeFilterEnriched*)MIMEFILTERENRICHED
{
	return CAMEL_MIME_FILTER_ENRICHED([self GOBJECT]);
}


@end