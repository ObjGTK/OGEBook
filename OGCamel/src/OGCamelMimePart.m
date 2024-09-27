/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelMimePart.h"

#import <OGio/OGCancellable.h>
#import "OGCamelMimeParser.h"

@implementation OGCamelMimePart

- (instancetype)init
{
	CamelMimePart* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_mime_part_new(), CamelMimePart, CamelMimePart);

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

- (CamelMimePart*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelMimePart, CamelMimePart);
}

- (bool)constructContentFromParserWithMp:(OGCamelMimeParser*)mp cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_mime_part_construct_content_from_parser([self castedGObject], [mp castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)constructFromParserWithParser:(OGCamelMimeParser*)parser ioPriority:(gint)ioPriority cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	camel_mime_part_construct_from_parser([self castedGObject], [parser castedGObject], ioPriority, [cancellable castedGObject], callback, userData);
}

- (bool)constructFromParserFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = camel_mime_part_construct_from_parser_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)constructFromParserSyncWithParser:(OGCamelMimeParser*)parser cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = camel_mime_part_construct_from_parser_sync([self castedGObject], [parser castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)generatePreviewWithFunc:(CamelGeneratePreviewFunc)func userData:(gpointer)userData
{
	gchar* gobjectValue = camel_mime_part_generate_preview([self castedGObject], func, userData);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (const CamelContentDisposition*)contentDisposition
{
	const CamelContentDisposition* returnValue = camel_mime_part_get_content_disposition([self castedGObject]);

	return returnValue;
}

- (OFString*)contentId
{
	const gchar* gobjectValue = camel_mime_part_get_content_id([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GList*)contentLanguages
{
	const GList* returnValue = camel_mime_part_get_content_languages([self castedGObject]);

	return returnValue;
}

- (OFString*)contentLocation
{
	const gchar* gobjectValue = camel_mime_part_get_content_location([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)contentMd5
{
	const gchar* gobjectValue = camel_mime_part_get_content_md5([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelContentType*)contentType
{
	CamelContentType* returnValue = camel_mime_part_get_content_type([self castedGObject]);

	return returnValue;
}

- (OFString*)description
{
	const gchar* gobjectValue = camel_mime_part_get_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)disposition
{
	const gchar* gobjectValue = camel_mime_part_get_disposition([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelTransferEncoding)encoding
{
	CamelTransferEncoding returnValue = camel_mime_part_get_encoding([self castedGObject]);

	return returnValue;
}

- (OFString*)filename
{
	const gchar* gobjectValue = camel_mime_part_get_filename([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setContentWithData:(OFString*)data length:(gint)length type:(OFString*)type
{
	camel_mime_part_set_content([self castedGObject], [data UTF8String], length, [type UTF8String]);
}

- (void)setContentId:(OFString*)contentid
{
	camel_mime_part_set_content_id([self castedGObject], [contentid UTF8String]);
}

- (void)setContentLanguages:(GList*)contentLanguages
{
	camel_mime_part_set_content_languages([self castedGObject], contentLanguages);
}

- (void)setContentLocation:(OFString*)location
{
	camel_mime_part_set_content_location([self castedGObject], [location UTF8String]);
}

- (void)setContentMd5:(OFString*)md5sum
{
	camel_mime_part_set_content_md5([self castedGObject], [md5sum UTF8String]);
}

- (void)setContentType:(OFString*)contentType
{
	camel_mime_part_set_content_type([self castedGObject], [contentType UTF8String]);
}

- (void)setDescription:(OFString*)description
{
	camel_mime_part_set_description([self castedGObject], [description UTF8String]);
}

- (void)setDisposition:(OFString*)disposition
{
	camel_mime_part_set_disposition([self castedGObject], [disposition UTF8String]);
}

- (void)setEncoding:(CamelTransferEncoding)encoding
{
	camel_mime_part_set_encoding([self castedGObject], encoding);
}

- (void)setFilename:(OFString*)filename
{
	camel_mime_part_set_filename([self castedGObject], [filename UTF8String]);
}


@end