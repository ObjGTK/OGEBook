/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeFilterCRLF.h"

@implementation OGCamelMimeFilterCRLF

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_FILTER_CRLF;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeFilterCRLFWithDirection:(CamelMimeFilterCRLFDirection)direction mode:(CamelMimeFilterCRLFMode)mode
{
	CamelMimeFilterCRLF* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_filter_crlf_new(direction, mode), CamelMimeFilterCRLF, CamelMimeFilterCRLF);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeFilterCRLF* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeFilterCRLF alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeFilterCRLF*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeFilterCRLF, CamelMimeFilterCRLF);
}

- (bool)ensureCrlfEnd
{
	bool returnValue = (bool)camel_mime_filter_crlf_get_ensure_crlf_end([self castedGObject]);

	return returnValue;
}

- (void)setEnsureCrlfEnd:(bool)ensureCrlfEnd
{
	camel_mime_filter_crlf_set_ensure_crlf_end([self castedGObject], ensureCrlfEnd);
}


@end