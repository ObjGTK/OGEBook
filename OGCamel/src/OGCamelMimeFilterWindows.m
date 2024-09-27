/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterWindows.h"

@implementation OGCamelMimeFilterWindows

- (instancetype)init:(OFString*)claimedCharset
{
	CamelMimeFilterWindows* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_windows_new([claimedCharset UTF8String]), CamelMimeFilterWindows, CamelMimeFilterWindows);

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

- (CamelMimeFilterWindows*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterWindows, CamelMimeFilterWindows);
}

- (bool)isWindowsCharset
{
	bool returnValue = camel_mime_filter_windows_is_windows_charset([self castedGObject]);

	return returnValue;
}

- (OFString*)realCharset
{
	const gchar* gobjectValue = camel_mime_filter_windows_real_charset([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end