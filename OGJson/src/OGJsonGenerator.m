/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonGenerator.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGOutputStream.h>

@implementation OGJsonGenerator

+ (void)load
{
	GType gtypeToAssociate = JSON_TYPE_GENERATOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)generator
{
	JsonGenerator* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_generator_new(), JsonGenerator, JsonGenerator);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGJsonGenerator* wrapperObject;
	@try {
		wrapperObject = [[OGJsonGenerator alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (JsonGenerator*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], JsonGenerator, JsonGenerator);
}

- (guint)indent
{
	guint returnValue = (guint)json_generator_get_indent([self castedGObject]);

	return returnValue;
}

- (gunichar)indentChar
{
	gunichar returnValue = (gunichar)json_generator_get_indent_char([self castedGObject]);

	return returnValue;
}

- (bool)pretty
{
	bool returnValue = (bool)json_generator_get_pretty([self castedGObject]);

	return returnValue;
}

- (JsonNode*)root
{
	JsonNode* returnValue = (JsonNode*)json_generator_get_root([self castedGObject]);

	return returnValue;
}

- (void)setIndent:(guint)indentLevel
{
	json_generator_set_indent([self castedGObject], indentLevel);
}

- (void)setIndentChar:(gunichar)indentChar
{
	json_generator_set_indent_char([self castedGObject], indentChar);
}

- (void)setPretty:(bool)isPretty
{
	json_generator_set_pretty([self castedGObject], isPretty);
}

- (void)setRoot:(JsonNode*)node
{
	json_generator_set_root([self castedGObject], node);
}

- (OFString*)toData:(gsize*)length
{
	gchar* gobjectValue = json_generator_to_data([self castedGObject], length);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (bool)toFile:(OFString*)filename
{
	GError* err = NULL;

	bool returnValue = (bool)json_generator_to_file([self castedGObject], [filename UTF8String], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (GString*)toGstring:(GString*)string
{
	GString* returnValue = (GString*)json_generator_to_gstring([self castedGObject], string);

	return returnValue;
}

- (bool)toStreamWithStream:(OGOutputStream*)stream cancellable:(OGCancellable*)cancellable
{
	GError* err = NULL;

	bool returnValue = (bool)json_generator_to_stream([self castedGObject], [stream castedGObject], [cancellable castedGObject], &err);

	[OGErrorException throwForError:err];

	return returnValue;
}


@end