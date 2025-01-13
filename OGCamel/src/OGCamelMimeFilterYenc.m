/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterYenc.h"

@implementation OGCamelMimeFilterYenc

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_YENC;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterYencWithDirection:(CamelMimeFilterYencDirection)direction
{
	CamelMimeFilterYenc* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_yenc_new(direction), CamelMimeFilterYenc, CamelMimeFilterYenc);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterYenc* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterYenc alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterYenc*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterYenc, CamelMimeFilterYenc);
}

- (guint32)crc
{
	guint32 returnValue = (guint32)camel_mime_filter_yenc_get_crc([self castedGObject]);

	return returnValue;
}

- (guint32)pcrc
{
	guint32 returnValue = (guint32)camel_mime_filter_yenc_get_pcrc([self castedGObject]);

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