/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimeParser.h"

#import "OGCamelMimeFilter.h"
#import "OGCamelStream.h"
#import <OGio/OGInputStream.h>

@implementation OGCamelMimeParser

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_MIME_PARSER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)mimeParser
{
	CamelMimeParser* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_parser_new(), CamelMimeParser, CamelMimeParser);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelMimeParser* wrapperObject;
	@try {
		wrapperObject = [[OGCamelMimeParser alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelMimeParser*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimeParser, CamelMimeParser);
}

- (CamelContentType*)contentType
{
	CamelContentType* returnValue = (CamelContentType*)camel_mime_parser_content_type([self castedGObject]);

	return returnValue;
}

- (void)dropStep
{
	camel_mime_parser_drop_step([self castedGObject]);
}

- (CamelNameValueArray*)dupHeaders
{
	CamelNameValueArray* returnValue = (CamelNameValueArray*)camel_mime_parser_dup_headers([self castedGObject]);

	return returnValue;
}

- (gint)errNo
{
	gint returnValue = (gint)camel_mime_parser_errno([self castedGObject]);

	return returnValue;
}

- (gint)filterAdd:(OGCamelMimeFilter*)mf
{
	gint returnValue = (gint)camel_mime_parser_filter_add([self castedGObject], [mf castedGObject]);

	return returnValue;
}

- (void)filterRemove:(gint)identifier
{
	camel_mime_parser_filter_remove([self castedGObject], identifier);
}

- (OFString*)fromLine
{
	const gchar* gobjectValue = camel_mime_parser_from_line([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)headerWithName:(OFString*)name offset:(gint*)offset
{
	const gchar* gobjectValue = camel_mime_parser_header([self castedGObject], [name UTF8String], offset);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)initWithBytes:(GBytes*)bytes
{
	camel_mime_parser_init_with_bytes([self castedGObject], bytes);
}

- (gint)initWithFd:(gint)fd
{
	gint returnValue = (gint)camel_mime_parser_init_with_fd([self castedGObject], fd);

	return returnValue;
}

- (void)initWithInputStream:(OGInputStream*)inputStream
{
	camel_mime_parser_init_with_input_stream([self castedGObject], [inputStream castedGObject]);
}

- (gint)initWithStream:(OGCamelStream*)stream
{
	GError* err = NULL;

	gint returnValue = (gint)camel_mime_parser_init_with_stream([self castedGObject], [stream castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OFString*)postface
{
	const gchar* gobjectValue = camel_mime_parser_postface([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)preface
{
	const gchar* gobjectValue = camel_mime_parser_preface([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)pushStateWithNewstate:(CamelMimeParserState)newstate boundary:(OFString*)boundary
{
	camel_mime_parser_push_state([self castedGObject], newstate, [boundary UTF8String]);
}

- (gssize)readWithDatabuffer:(const gchar**)databuffer len:(gssize)len
{
	GError* err = NULL;

	gssize returnValue = (gssize)camel_mime_parser_read([self castedGObject], databuffer, len, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)scanFrom:(bool)scanFrom
{
	camel_mime_parser_scan_from([self castedGObject], scanFrom);
}

- (void)scanPreFrom:(bool)scanPreFrom
{
	camel_mime_parser_scan_pre_from([self castedGObject], scanPreFrom);
}

- (goffset)seekWithOffset:(goffset)offset whence:(gint)whence
{
	goffset returnValue = (goffset)camel_mime_parser_seek([self castedGObject], offset, whence);

	return returnValue;
}

- (gint)setHeaderRegex:(OFString*)matchstr
{
	gint returnValue = (gint)camel_mime_parser_set_header_regex([self castedGObject], g_strdup([matchstr UTF8String]));

	return returnValue;
}

- (CamelMimeParserState)state
{
	CamelMimeParserState returnValue = (CamelMimeParserState)camel_mime_parser_state([self castedGObject]);

	return returnValue;
}

- (CamelMimeParserState)stepWithDatabuffer:(gchar**)databuffer datalength:(gsize*)datalength
{
	CamelMimeParserState returnValue = (CamelMimeParserState)camel_mime_parser_step([self castedGObject], databuffer, datalength);

	return returnValue;
}

- (OGCamelStream*)stream
{
	CamelStream* gobjectValue = camel_mime_parser_stream([self castedGObject]);

	OGCamelStream* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (goffset)tell
{
	goffset returnValue = (goffset)camel_mime_parser_tell([self castedGObject]);

	return returnValue;
}

- (goffset)tellStartBoundary
{
	goffset returnValue = (goffset)camel_mime_parser_tell_start_boundary([self castedGObject]);

	return returnValue;
}

- (goffset)tellStartFrom
{
	goffset returnValue = (goffset)camel_mime_parser_tell_start_from([self castedGObject]);

	return returnValue;
}

- (goffset)tellStartHeaders
{
	goffset returnValue = (goffset)camel_mime_parser_tell_start_headers([self castedGObject]);

	return returnValue;
}

- (void)unstep
{
	camel_mime_parser_unstep([self castedGObject]);
}


@end