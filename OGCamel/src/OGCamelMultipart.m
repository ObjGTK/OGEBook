/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipart.h"

#import "OGCamelMimePart.h"
#import "OGCamelMimeParser.h"

@implementation OGCamelMultipart

- (instancetype)init
{
	CamelMultipart* gobjectValue = CAMEL_MULTIPART(camel_multipart_new());

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

- (CamelMultipart*)castedGObject
{
	return CAMEL_MULTIPART([self gObject]);
}

- (void)addPart:(OGCamelMimePart*)part
{
	camel_multipart_add_part([self castedGObject], [part castedGObject]);
}

- (gint)constructFromParser:(OGCamelMimeParser*)parser
{
	gint returnValue = camel_multipart_construct_from_parser([self castedGObject], [parser castedGObject]);

	return returnValue;
}

- (OFString*)boundary
{
	const gchar* gobjectValue = camel_multipart_get_boundary([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint)number
{
	guint returnValue = camel_multipart_get_number([self castedGObject]);

	return returnValue;
}

- (OGCamelMimePart*)part:(guint)index
{
	CamelMimePart* gobjectValue = CAMEL_MIME_PART(camel_multipart_get_part([self castedGObject], index));

	OGCamelMimePart* returnValue = [OGCamelMimePart withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)postface
{
	const gchar* gobjectValue = camel_multipart_get_postface([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)preface
{
	const gchar* gobjectValue = camel_multipart_get_preface([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setBoundary:(OFString*)boundary
{
	camel_multipart_set_boundary([self castedGObject], [boundary UTF8String]);
}

- (void)setPostface:(OFString*)postface
{
	camel_multipart_set_postface([self castedGObject], [postface UTF8String]);
}

- (void)setPreface:(OFString*)preface
{
	camel_multipart_set_preface([self castedGObject], [preface UTF8String]);
}


@end