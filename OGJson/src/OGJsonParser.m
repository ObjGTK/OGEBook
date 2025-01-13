/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonParser.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>

@implementation OGJsonParser

+ (void)load
{
	GType gtypeToAssociate = JSON_TYPE_PARSER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)parser
{
	JsonParser* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_parser_new(), JsonParser, JsonParser);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGJsonParser* wrapperObject;
	@try {
		wrapperObject = [[OGJsonParser alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)parserImmutable
{
	JsonParser* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_parser_new_immutable(), JsonParser, JsonParser);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGJsonParser* wrapperObject;
	@try {
		wrapperObject = [[OGJsonParser alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (JsonParser*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], JsonParser, JsonParser);
}

- (guint)currentLine
{
	guint returnValue = (guint)json_parser_get_current_line([self castedGObject]);

	return returnValue;
}

- (guint)currentPos
{
	guint returnValue = (guint)json_parser_get_current_pos([self castedGObject]);

	return returnValue;
}

- (JsonNode*)root
{
	JsonNode* returnValue = (JsonNode*)json_parser_get_root([self castedGObject]);

	return returnValue;
}

- (bool)hasAssignmentWithVariableName:(gchar**)variableName
{
	bool returnValue = (bool)json_parser_has_assignment([self castedGObject], variableName);

	return returnValue;
}

- (bool)loadFromData:(OFString*)data length:(gssize)length
{
	GError* err = NULL;

	bool returnValue = (bool)json_parser_load_from_data([self castedGObject], [data UTF8String], length, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadFromFileWithFilename:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)json_parser_load_from_file([self castedGObject], [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadFromMappedFileWithFilename:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)json_parser_load_from_mapped_file([self castedGObject], [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (bool)loadFromStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)json_parser_load_from_stream([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)loadFromStreamAsync:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	json_parser_load_from_stream_async([self castedGObject], [stream castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)loadFromStreamFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)json_parser_load_from_stream_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (JsonNode*)stealRoot
{
	JsonNode* returnValue = (JsonNode*)json_parser_steal_root([self castedGObject]);

	return returnValue;
}


@end