/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMultipart.h"

#import "OGCamelMimeParser.h"
#import "OGCamelMimePart.h"

@implementation OGCamelMultipart

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_multipart_new()];

	return self;
}

- (CamelMultipart*)MULTIPART
{
	return CAMEL_MULTIPART([self GOBJECT]);
}

- (void)addPart:(OGCamelMimePart*)part
{
	camel_multipart_add_part([self MULTIPART], [part MIMEPART]);
}

- (gint)constructFromParser:(OGCamelMimeParser*)parser
{
	return camel_multipart_construct_from_parser([self MULTIPART], [parser MIMEPARSER]);
}

- (OFString*)boundary
{
	return [OFString stringWithUTF8String:camel_multipart_get_boundary([self MULTIPART])];
}

- (guint)number
{
	return camel_multipart_get_number([self MULTIPART]);
}

- (OGCamelMimePart*)part:(guint)index
{
	return [[[OGCamelMimePart alloc] initWithGObject:(GObject*)camel_multipart_get_part([self MULTIPART], index)] autorelease];
}

- (OFString*)postface
{
	return [OFString stringWithUTF8String:camel_multipart_get_postface([self MULTIPART])];
}

- (OFString*)preface
{
	return [OFString stringWithUTF8String:camel_multipart_get_preface([self MULTIPART])];
}

- (void)setBoundary:(OFString*)boundary
{
	camel_multipart_set_boundary([self MULTIPART], [boundary UTF8String]);
}

- (void)setPostface:(OFString*)postface
{
	camel_multipart_set_postface([self MULTIPART], [postface UTF8String]);
}

- (void)setPreface:(OFString*)preface
{
	camel_multipart_set_preface([self MULTIPART], [preface UTF8String]);
}


@end