/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterYenc.h"

@implementation OGCamelMimeFilterYenc

- (instancetype)init:(CamelMimeFilterYencDirection)direction
{
	CamelMimeFilterYenc* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_yenc_new(direction), CamelMimeFilterYenc, CamelMimeFilterYenc);

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

- (CamelMimeFilterYenc*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterYenc, CamelMimeFilterYenc);
}

- (guint32)crc
{
	guint32 returnValue = camel_mime_filter_yenc_get_crc([self castedGObject]);

	return returnValue;
}

- (guint32)pcrc
{
	guint32 returnValue = camel_mime_filter_yenc_get_pcrc([self castedGObject]);

	return returnValue;
}

- (void)setCrc:(guint32)crc
{
	camel_mime_filter_yenc_set_crc([self castedGObject], crc);
}

- (void)setState:(gint)state
{
	camel_mime_filter_yenc_set_state([self castedGObject], state);
}


@end