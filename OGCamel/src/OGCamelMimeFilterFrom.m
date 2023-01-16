/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterFrom.h"

@implementation OGCamelMimeFilterFrom

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_from_new()];

	return self;
}

- (CamelMimeFilterFrom*)MIMEFILTERFROM
{
	return CAMEL_MIME_FILTER_FROM([self GOBJECT]);
}


@end