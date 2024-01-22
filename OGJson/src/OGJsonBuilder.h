/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <json-glib/json-glib.h>

#import <OGObject/OGObject.h>

/**
 * `JsonBuilder` provides an object for generating a JSON tree.
 * 
 * The root of the JSON tree can be either a [struct@Json.Object] or a [struct@Json.Array].
 * Thus the first call must necessarily be either
 * [method@Json.Builder.begin_object] or [method@Json.Builder.begin_array].
 * 
 * For convenience to language bindings, most `JsonBuilder` method return the
 * instance, making it easy to chain function calls.
 * 
 * ## Using `JsonBuilder`
 * 
 * ```c
 * g_autoptr(JsonBuilder) builder = json_builder_new ();
 * 
 * json_builder_begin_object (builder);
 * 
 * json_builder_set_member_name (builder, "url");
 * json_builder_add_string_value (builder, "http://www.gnome.org/img/flash/two-thirty.png");
 * 
 * json_builder_set_member_name (builder, "size");
 * json_builder_begin_array (builder);
 * json_builder_add_int_value (builder, 652);
 * json_builder_add_int_value (builder, 242);
 * json_builder_end_array (builder);
 * 
 * json_builder_end_object (builder);
 * 
 * g_autoptr(JsonNode) root = json_builder_get_root (builder);
 * 
 * g_autoptr(JsonGenerator) gen = json_generator_new ();
 * json_generator_set_root (gen, root);
 * g_autofree char *str = json_generator_to_data (gen, NULL);
 * 
 * // str now contains the following JSON data
 * // { "url" : "http://www.gnome.org/img/flash/two-thirty.png", "size" : [ 652, 242 ] }
 * ```
 *
 */
@interface OGJsonBuilder : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;
- (instancetype)initImmutable;

/**
 * Methods
 */

- (JsonBuilder*)castedGObject;

/**
 * Adds a boolean value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given value
 * as the value of the current member in the open object; otherwise, the value
 * is appended to the elements of the open array.
 * 
 * See also: [method@Json.Builder.add_value]
 *
 * @param value the value of the member or element
 * @return the builder instance
 */
- (OGJsonBuilder*)addBooleanValue:(bool)value;

/**
 * Adds a floating point value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given value
 * as the value of the current member in the open object; otherwise, the value
 * is appended to the elements of the open array.
 * 
 * See also: [method@Json.Builder.add_value]
 *
 * @param value the value of the member or element
 * @return the builder instance
 */
- (OGJsonBuilder*)addDoubleValue:(gdouble)value;

/**
 * Adds an integer value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given value
 * as the value of the current member in the open object; otherwise, the value
 * is appended to the elements of the open array.
 * 
 * See also: [method@Json.Builder.add_value]
 *
 * @param value the value of the member or element
 * @return the builder instance
 */
- (OGJsonBuilder*)addIntValue:(gint64)value;

/**
 * Adds a null value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given value
 * as the value of the current member in the open object; otherwise, the value
 * is appended to the elements of the open array.
 * 
 * See also: [method@Json.Builder.add_value]
 *
 * @return the builder instance
 */
- (OGJsonBuilder*)addNullValue;

/**
 * Adds a boolean value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given value
 * as the value of the current member in the open object; otherwise, the value
 * is appended to the elements of the open array.
 * 
 * See also: [method@Json.Builder.add_value]
 *
 * @param value the value of the member or element
 * @return the builder instance
 */
- (OGJsonBuilder*)addStringValue:(OFString*)value;

/**
 * Adds a value to the currently open object member or array.
 * 
 * If called after [method@Json.Builder.set_member_name], sets the given node
 * as the value of the current member in the open object; otherwise, the node
 * is appended to the elements of the open array.
 * 
 * The builder will take ownership of the node.
 *
 * @param node the value of the member or element
 * @return the builder instance
 */
- (OGJsonBuilder*)addValue:(JsonNode*)node;

/**
 * Opens an array inside the given builder.
 * 
 * You can add a new element to the array by using [method@Json.Builder.add_value].
 * 
 * Once you added all elements to the array, you must call
 * [method@Json.Builder.end_array] to close the array.
 *
 * @return the builder instance
 */
- (OGJsonBuilder*)beginArray;

/**
 * Opens an object inside the given builder.
 * 
 * You can add a new member to the object by using [method@Json.Builder.set_member_name],
 * followed by [method@Json.Builder.add_value].
 * 
 * Once you added all members to the object, you must call [method@Json.Builder.end_object]
 * to close the object.
 * 
 * If the builder is in an inconsistent state, this function will return `NULL`.
 *
 * @return the builder instance
 */
- (OGJsonBuilder*)beginObject;

/**
 * Closes the array inside the given builder that was opened by the most
 * recent call to [method@Json.Builder.begin_array].
 * 
 * This function cannot be called after [method@Json.Builder.set_member_name].
 *
 * @return the builder instance
 */
- (OGJsonBuilder*)endArray;

/**
 * Closes the object inside the given builder that was opened by the most
 * recent call to [method@Json.Builder.begin_object].
 * 
 * This function cannot be called after [method@Json.Builder.set_member_name].
 *
 * @return the builder instance
 */
- (OGJsonBuilder*)endObject;

/**
 * Returns the root of the currently constructed tree.
 * 
 * if the build is incomplete (ie: if there are any opened objects, or any
 * open object members and array elements) then this function will return
 * `NULL`.
 *
 * @return the root node
 */
- (JsonNode*)root;

/**
 * Resets the state of the builder back to its initial state.
 *
 */
- (void)reset;

/**
 * Sets the name of the member in an object.
 * 
 * This function must be followed by of these functions:
 * 
 *  - [method@Json.Builder.add_value], to add a scalar value to the member
 *  - [method@Json.Builder.begin_object], to add an object to the member
 *  - [method@Json.Builder.begin_array], to add an array to the member
 * 
 * This function can only be called within an open object.
 *
 * @param memberName the name of the member
 * @return the builder instance
 */
- (OGJsonBuilder*)setMemberName:(OFString*)memberName;

@end