/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimePart.h"

#import "OGCamelMimeParser.h"

@implementation OGCamelMimePart

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_part_new()];

	return self;
}

- (CamelMimePart*)MIMEPART
{
	return CAMEL_MIME_PART([self GOBJECT]);
}

- (bool)constructContentFromParserWithMp:(OGCamelMimeParser*)mp cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_mime_part_construct_content_from_parser([self MIMEPART], [mp MIMEPARSER], cancellable, err);
}

- (void)constructFromParserWithParser:(OGCamelMimeParser*)parser ioPriority:(gint)ioPriority cancellable:(GCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_mime_part_construct_from_parser([self MIMEPART], [parser MIMEPARSER], ioPriority, cancellable, callback, userData);
}

- (bool)constructFromParserFinishWithResult:(GAsyncResult*)result err:(GError**)err
{
	return camel_mime_part_construct_from_parser_finish([self MIMEPART], result, err);
}

- (bool)constructFromParserSyncWithParser:(OGCamelMimeParser*)parser cancellable:(GCancellable*)cancellable err:(GError**)err
{
	return camel_mime_part_construct_from_parser_sync([self MIMEPART], [parser MIMEPARSER], cancellable, err);
}

- (const CamelContentDisposition*)contentDisposition
{
	return camel_mime_part_get_content_disposition([self MIMEPART]);
}

- (OFString*)contentId
{
	return [OFString stringWithUTF8String:camel_mime_part_get_content_id([self MIMEPART])];
}

- (const GList*)contentLanguages
{
	return camel_mime_part_get_content_languages([self MIMEPART]);
}

- (OFString*)contentLocation
{
	return [OFString stringWithUTF8String:camel_mime_part_get_content_location([self MIMEPART])];
}

- (OFString*)contentMd5
{
	return [OFString stringWithUTF8String:camel_mime_part_get_content_md5([self MIMEPART])];
}

- (CamelContentType*)contentType
{
	return camel_mime_part_get_content_type([self MIMEPART]);
}

- (OFString*)description
{
	return [OFString stringWithUTF8String:camel_mime_part_get_description([self MIMEPART])];
}

- (OFString*)disposition
{
	return [OFString stringWithUTF8String:camel_mime_part_get_disposition([self MIMEPART])];
}

- (CamelTransferEncoding)encoding
{
	return camel_mime_part_get_encoding([self MIMEPART]);
}

- (OFString*)filename
{
	return [OFString stringWithUTF8String:camel_mime_part_get_filename([self MIMEPART])];
}

- (void)setContentWithData:(OFString*)data length:(gint)length type:(OFString*)type
{
	camel_mime_part_set_content([self MIMEPART], [data UTF8String], length, [type UTF8String]);
}

- (void)setContentId:(OFString*)contentid
{
	camel_mime_part_set_content_id([self MIMEPART], [contentid UTF8String]);
}

- (void)setContentLanguages:(GList*)contentLanguages
{
	camel_mime_part_set_content_languages([self MIMEPART], contentLanguages);
}

- (void)setContentLocation:(OFString*)location
{
	camel_mime_part_set_content_location([self MIMEPART], [location UTF8String]);
}

- (void)setContentMd5:(OFString*)md5sum
{
	camel_mime_part_set_content_md5([self MIMEPART], [md5sum UTF8String]);
}

- (void)setContentType:(OFString*)contentType
{
	camel_mime_part_set_content_type([self MIMEPART], [contentType UTF8String]);
}

- (void)setDescription:(OFString*)description
{
	camel_mime_part_set_description([self MIMEPART], [description UTF8String]);
}

- (void)setDisposition:(OFString*)disposition
{
	camel_mime_part_set_disposition([self MIMEPART], [disposition UTF8String]);
}

- (void)setEncoding:(CamelTransferEncoding)encoding
{
	camel_mime_part_set_encoding([self MIMEPART], encoding);
}

- (void)setFilename:(OFString*)filename
{
	camel_mime_part_set_filename([self MIMEPART], [filename UTF8String]);
}


@end