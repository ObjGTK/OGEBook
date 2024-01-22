/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonParser.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>

@implementation OGJsonParser

- (instancetype)init
{
	JsonParser* gobjectValue = JSON_PARSER(json_parser_new());

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

- (instancetype)initImmutable
{
	JsonParser* gobjectValue = JSON_PARSER(json_parser_new_immutable());

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

- (JsonParser*)castedGObject
{
	return JSON_PARSER([self gObject]);
}

- (guint)currentLine
{
	guint returnValue = json_parser_get_current_line([self castedGObject]);

	return returnValue;
}

- (guint)currentPos
{
	guint returnValue = json_parser_get_current_pos([self castedGObject]);

	return returnValue;
}

- (JsonNode*)root
{
	JsonNode* returnValue = json_parser_get_root([self castedGObject]);

	return returnValue;
}

- (bool)hasAssignment:(gchar**)variableName
{
	bool returnValue = json_parser_has_assignment([self castedGObject], variableName);

	return returnValue;
}

- (bool)loadFromDataWithData:(OFString*)data length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = json_parser_load_from_data([self castedGObject], [data UTF8String], length, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)loadFromFile:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = json_parser_load_from_file([self castedGObject], [filename UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)loadFromMappedFile:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = json_parser_load_from_mapped_file([self castedGObject], [filename UTF8String], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)loadFromStreamWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = json_parser_load_from_stream([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)loadFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	json_parser_load_from_stream_async([self castedGObject], [stream castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)loadFromStreamFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = json_parser_load_from_stream_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (JsonNode*)stealRoot
{
	JsonNode* returnValue = json_parser_steal_root([self castedGObject]);

	return returnValue;
}


@end