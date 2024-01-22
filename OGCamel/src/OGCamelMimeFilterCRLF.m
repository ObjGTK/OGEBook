/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCRLF.h"

@implementation OGCamelMimeFilterCRLF

- (instancetype)initWithDirection:(CamelMimeFilterCRLFDirection)direction mode:(CamelMimeFilterCRLFMode)mode
{
	CamelMimeFilterCRLF* gobjectValue = CAMEL_MIME_FILTER_CRLF(camel_mime_filter_crlf_new(direction, mode));

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

- (CamelMimeFilterCRLF*)castedGObject
{
	return CAMEL_MIME_FILTER_CRLF([self gObject]);
}

- (bool)ensureCrlfEnd
{
	bool returnValue = camel_mime_filter_crlf_get_ensure_crlf_end([self castedGObject]);

	return returnValue;
}

- (void)setEnsureCrlfEnd:(bool)ensureCrlfEnd
{
	camel_mime_filter_crlf_set_ensure_crlf_end([self castedGObject], ensureCrlfEnd);
}


@end