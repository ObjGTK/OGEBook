/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterBasic.h"

@implementation OGCamelMimeFilterBasic

- (instancetype)init:(CamelMimeFilterBasicType)type
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_basic_new(type)];

	return self;
}

- (CamelMimeFilterBasic*)MIMEFILTERBASIC
{
	return CAMEL_MIME_FILTER_BASIC([self GOBJECT]);
}


@end