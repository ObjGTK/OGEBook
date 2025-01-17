/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonBuilder.h"

@implementation OGJsonBuilder

+ (void)load
{
	GType gtypeToAssociate = JSON_TYPE_BUILDER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)builder
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_new(), JsonBuilder, JsonBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGJsonBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGJsonBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)builderImmutable
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_new_immutable(), JsonBuilder, JsonBuilder);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGJsonBuilder* wrapperObject;
	@try {
		wrapperObject = [[OGJsonBuilder alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (JsonBuilder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], JsonBuilder, JsonBuilder);
}

- (OGJsonBuilder*)addBooleanValue:(bool)value
{
	JsonBuilder* gobjectValue = json_builder_add_boolean_value([self castedGObject], value);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)addDoubleValue:(gdouble)value
{
	JsonBuilder* gobjectValue = json_builder_add_double_value([self castedGObject], value);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)addIntValue:(gint64)value
{
	JsonBuilder* gobjectValue = json_builder_add_int_value([self castedGObject], value);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)addNullValue
{
	JsonBuilder* gobjectValue = json_builder_add_null_value([self castedGObject]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)addStringValue:(OFString*)value
{
	JsonBuilder* gobjectValue = json_builder_add_string_value([self castedGObject], [value UTF8String]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)addValueWithNode:(JsonNode*)node
{
	JsonBuilder* gobjectValue = json_builder_add_value([self castedGObject], node);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)beginArray
{
	JsonBuilder* gobjectValue = json_builder_begin_array([self castedGObject]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)beginObject
{
	JsonBuilder* gobjectValue = json_builder_begin_object([self castedGObject]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)endArray
{
	JsonBuilder* gobjectValue = json_builder_end_array([self castedGObject]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGJsonBuilder*)endObject
{
	JsonBuilder* gobjectValue = json_builder_end_object([self castedGObject]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (JsonNode*)root
{
	JsonNode* returnValue = (JsonNode*)json_builder_get_root([self castedGObject]);

	return returnValue;
}

- (void)reset
{
	json_builder_reset([self castedGObject]);
}

- (OGJsonBuilder*)setMemberName:(OFString*)memberName
{
	JsonBuilder* gobjectValue = json_builder_set_member_name([self castedGObject], [memberName UTF8String]);

	OGJsonBuilder* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}


@end