/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonReader.h"

@implementation OGJsonReader

- (instancetype)init:(JsonNode*)node
{
	JsonReader* gobjectValue = JSON_READER(json_reader_new(node));

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

- (JsonReader*)castedGObject
{
	return JSON_READER([self gObject]);
}

- (gint)countElements
{
	gint returnValue = json_reader_count_elements([self castedGObject]);

	return returnValue;
}

- (gint)countMembers
{
	gint returnValue = json_reader_count_members([self castedGObject]);

	return returnValue;
}

- (void)endElement
{
	json_reader_end_element([self castedGObject]);
}

- (void)endMember
{
	json_reader_end_member([self castedGObject]);
}

- (bool)booleanValue
{
	bool returnValue = json_reader_get_boolean_value([self castedGObject]);

	return returnValue;
}

- (JsonNode*)currentNode
{
	JsonNode* returnValue = json_reader_get_current_node([self castedGObject]);

	return returnValue;
}

- (gdouble)doubleValue
{
	gdouble returnValue = json_reader_get_double_value([self castedGObject]);

	return returnValue;
}

- (const GError*)error
{
	const GError* returnValue = json_reader_get_error([self castedGObject]);

	return returnValue;
}

- (gint64)intValue
{
	gint64 returnValue = json_reader_get_int_value([self castedGObject]);

	return returnValue;
}

- (OFString*)memberName
{
	const gchar* gobjectValue = json_reader_get_member_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)nullValue
{
	bool returnValue = json_reader_get_null_value([self castedGObject]);

	return returnValue;
}

- (OFString*)stringValue
{
	const gchar* gobjectValue = json_reader_get_string_value([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (JsonNode*)value
{
	JsonNode* returnValue = json_reader_get_value([self castedGObject]);

	return returnValue;
}

- (bool)isArray
{
	bool returnValue = json_reader_is_array([self castedGObject]);

	return returnValue;
}

- (bool)isObject
{
	bool returnValue = json_reader_is_object([self castedGObject]);

	return returnValue;
}

- (bool)isValue
{
	bool returnValue = json_reader_is_value([self castedGObject]);

	return returnValue;
}

- (gchar**)listMembers
{
	gchar** returnValue = json_reader_list_members([self castedGObject]);

	return returnValue;
}

- (bool)readElement:(guint)index
{
	bool returnValue = json_reader_read_element([self castedGObject], index);

	return returnValue;
}

- (bool)readMember:(OFString*)memberName
{
	bool returnValue = json_reader_read_member([self castedGObject], [memberName UTF8String]);

	return returnValue;
}

- (void)setRoot:(JsonNode*)root
{
	json_reader_set_root([self castedGObject], root);
}


@end