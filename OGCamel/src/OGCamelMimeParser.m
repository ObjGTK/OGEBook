/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeParser.h"

#import "OGCamelStream.h"
#import "OGCamelMimeFilter.h"

@implementation OGCamelMimeParser

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_mime_parser_new()];

	return self;
}

- (CamelMimeParser*)MIMEPARSER
{
	return CAMEL_MIME_PARSER([self GOBJECT]);
}

- (CamelContentType*)contentType
{
	return camel_mime_parser_content_type([self MIMEPARSER]);
}

- (void)dropStep
{
	camel_mime_parser_drop_step([self MIMEPARSER]);
}

- (CamelNameValueArray*)dupHeaders
{
	return camel_mime_parser_dup_headers([self MIMEPARSER]);
}

- (gint)errNo
{
	return camel_mime_parser_errno([self MIMEPARSER]);
}

- (gint)filterAdd:(OGCamelMimeFilter*)mf
{
	return camel_mime_parser_filter_add([self MIMEPARSER], [mf MIMEFILTER]);
}

- (void)filterRemove:(gint)id
{
	camel_mime_parser_filter_remove([self MIMEPARSER], id);
}

- (OFString*)fromLine
{
	return [OFString stringWithUTF8String:camel_mime_parser_from_line([self MIMEPARSER])];
}

- (OFString*)headerWithName:(OFString*)name offset:(gint*)offset
{
	return [OFString stringWithUTF8String:camel_mime_parser_header([self MIMEPARSER], [name UTF8String], offset)];
}

- (void)initWithBytes:(GBytes*)bytes
{
	camel_mime_parser_init_with_bytes([self MIMEPARSER], bytes);
}

- (gint)initWithFd:(gint)fd
{
	return camel_mime_parser_init_with_fd([self MIMEPARSER], fd);
}

- (void)initWithInputStream:(GInputStream*)inputStream
{
	camel_mime_parser_init_with_input_stream([self MIMEPARSER], inputStream);
}

- (gint)initWithStreamWithStream:(OGCamelStream*)stream err:(GError**)err
{
	return camel_mime_parser_init_with_stream([self MIMEPARSER], [stream STREAM], err);
}

- (OFString*)postface
{
	return [OFString stringWithUTF8String:camel_mime_parser_postface([self MIMEPARSER])];
}

- (OFString*)preface
{
	return [OFString stringWithUTF8String:camel_mime_parser_preface([self MIMEPARSER])];
}

- (void)pushStateWithNewstate:(CamelMimeParserState)newstate boundary:(OFString*)boundary
{
	camel_mime_parser_push_state([self MIMEPARSER], newstate, [boundary UTF8String]);
}

- (gssize)readWithDatabuffer:(const gchar**)databuffer len:(gssize)len err:(GError**)err
{
	return camel_mime_parser_read([self MIMEPARSER], databuffer, len, err);
}

- (void)scanFrom:(bool)scanFrom
{
	camel_mime_parser_scan_from([self MIMEPARSER], scanFrom);
}

- (void)scanPreFrom:(bool)scanPreFrom
{
	camel_mime_parser_scan_pre_from([self MIMEPARSER], scanPreFrom);
}

- (goffset)seekWithOffset:(goffset)offset whence:(gint)whence
{
	return camel_mime_parser_seek([self MIMEPARSER], offset, whence);
}

- (gint)setHeaderRegex:(OFString*)matchstr
{
	return camel_mime_parser_set_header_regex([self MIMEPARSER], (gchar*) [matchstr UTF8String]);
}

- (CamelMimeParserState)state
{
	return camel_mime_parser_state([self MIMEPARSER]);
}

- (CamelMimeParserState)stepWithDatabuffer:(gchar**)databuffer datalength:(gsize*)datalength
{
	return camel_mime_parser_step([self MIMEPARSER], databuffer, datalength);
}

- (OGCamelStream*)stream
{
	return [[[OGCamelStream alloc] initWithGObject:(GObject*)camel_mime_parser_stream([self MIMEPARSER])] autorelease];
}

- (goffset)tell
{
	return camel_mime_parser_tell([self MIMEPARSER]);
}

- (goffset)tellStartBoundary
{
	return camel_mime_parser_tell_start_boundary([self MIMEPARSER]);
}

- (goffset)tellStartFrom
{
	return camel_mime_parser_tell_start_from([self MIMEPARSER]);
}

- (goffset)tellStartHeaders
{
	return camel_mime_parser_tell_start_headers([self MIMEPARSER]);
}

- (void)unstep
{
	camel_mime_parser_unstep([self MIMEPARSER]);
}


@end