/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterWindows.h"

@implementation OGCamelMimeFilterWindows

- (instancetype)init:(OFString*)claimedCharset
{
	self = [super initWithGObject:(GObject*)camel_mime_filter_windows_new([claimedCharset UTF8String])];

	return self;
}

- (CamelMimeFilterWindows*)MIMEFILTERWINDOWS
{
	return CAMEL_MIME_FILTER_WINDOWS([self GOBJECT]);
}

- (bool)isWindowsCharset
{
	return camel_mime_filter_windows_is_windows_charset([self MIMEFILTERWINDOWS]);
}

- (OFString*)realCharset
{
	return [OFString stringWithUTF8String:camel_mime_filter_windows_real_charset([self MIMEFILTERWINDOWS])];
}


@end