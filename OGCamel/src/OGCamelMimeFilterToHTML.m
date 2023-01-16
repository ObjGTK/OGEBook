/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterToHTML.h"

@implementation OGCamelMimeFilterToHTML

- (instancetype)initWithFlags:(CamelMimeFilterToHTMLFlags)flags color:(guint32)color
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_tohtml_new(flags, color)];

	return self;
}

- (CamelMimeFilterToHTML*)MIMEFILTERTOHTML
{
	return CAMEL_MIME_FILTER_TOHTML([self GOBJECT]);
}


@end