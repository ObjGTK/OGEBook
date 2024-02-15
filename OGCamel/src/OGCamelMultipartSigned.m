/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipartSigned.h"

#import "OGCamelMimePart.h"
#import "OGCamelStream.h"

@implementation OGCamelMultipartSigned

- (instancetype)init
{
	CamelMultipartSigned* gobjectValue = CAMEL_MULTIPART_SIGNED(camel_multipart_signed_new());

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

- (CamelMultipartSigned*)castedGObject
{
	return CAMEL_MULTIPART_SIGNED([self gObject]);
}

- (OGCamelStream*)contentStream
{
	GError* err = NULL;

	CamelStream* gobjectValue = CAMEL_STREAM(camel_multipart_signed_get_content_stream([self castedGObject], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGCamelStream* returnValue = [OGCamelStream withGObject:gobjectValue];
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