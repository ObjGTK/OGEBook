/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCRLF.h"

@implementation OGCamelMimeFilterCRLF

- (instancetype)initWithDirection:(CamelMimeFilterCRLFDirection)direction mode:(CamelMimeFilterCRLFMode)mode
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_crlf_new(direction, mode)];

	return self;
}

- (CamelMimeFilterCRLF*)MIMEFILTERCRLF
{
	return CAMEL_MIME_FILTER_CRLF([self GOBJECT]);
}


@end