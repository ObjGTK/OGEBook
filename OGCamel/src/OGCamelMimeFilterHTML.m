/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterHTML.h"

@implementation OGCamelMimeFilterHTML

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_html_new()];

	return self;
}

- (CamelMimeFilterHTML*)MIMEFILTERHTML
{
	return CAMEL_MIME_FILTER_HTML([self GOBJECT]);
}


@end