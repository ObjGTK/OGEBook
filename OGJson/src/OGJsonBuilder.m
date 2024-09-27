/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGJsonBuilder.h"

@implementation OGJsonBuilder

- (instancetype)init
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_new(), JsonBuilder, JsonBuilder);

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
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_new_immutable(), JsonBuilder, JsonBuilder);

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

- (JsonBuilder*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], JsonBuilder, JsonBuilder);
}

- (OGJsonBuilder*)addBooleanValue:(bool)value
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_boolean_value([self castedGObject], value), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)addDoubleValue:(gdouble)value
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_double_value([self castedGObject], value), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)addIntValue:(gint64)value
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_int_value([self castedGObject], value), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)addNullValue
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_null_value([self castedGObject]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)addStringValue:(OFString*)value
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_string_value([self castedGObject], [value UTF8String]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)addValue:(JsonNode*)node
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_add_value([self castedGObject], node), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)beginArray
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_begin_array([self castedGObject]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)beginObject
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_begin_object([self castedGObject]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)endArray
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_end_array([self castedGObject]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (OGJsonBuilder*)endObject
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_end_object([self castedGObject]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}

- (JsonNode*)root
{
	JsonNode* returnValue = json_builder_get_root([self castedGObject]);

	return returnValue;
}

- (void)reset
{
	json_builder_reset([self castedGObject]);
}

- (OGJsonBuilder*)setMemberName:(OFString*)memberName
{
	JsonBuilder* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(json_builder_set_member_name([self castedGObject], [memberName UTF8String]), JsonBuilder, JsonBuilder);

	OGJsonBuilder* returnValue = [OGJsonBuilder withGObject:gobjectValue];
	return returnValue;
}


@end