/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartSigned.h"

#import "OGCamelMimePart.h"
#import "OGCamelStream.h"

@implementation OGCamelMultipartSigned

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MULTIPART_SIGNED;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)multipartSigned
{
	CamelMultipartSigned* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_multipart_signed_new(), CamelMultipartSigned, CamelMultipartSigned);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMultipartSigned* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMultipartSigned alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMultipartSigned*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMultipartSigned, CamelMultipartSigned);
}

- (OGCamelStream*)contentStream
{
	GError* err = NULL;

	CamelStream* gobjectValue = camel_multipart_signed_get_content_stream([self castedGObject], &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGCamelStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)setContentStream:(OGCamelStream*)contentStream
{
	camel_multipart_signed_set_content_stream([self castedGObject], [contentStream castedGObject]);
}

- (void)setSignature:(OGCamelMimePart*)signature
{
	camel_multipart_signed_set_signature([self castedGObject], [signature castedGObject]);
}


@end