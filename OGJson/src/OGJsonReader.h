/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <json-glib/json-glib.h>

#import <OGObject/OGObject.h>

/**
 * `JsonReader` provides a simple, cursor-based API for parsing a JSON DOM.
 * 
 * It is similar, in spirit, to the XML Reader API.
 * 
 * ## Using `JsonReader`
 * 
 * ```c
 * g_autoptr(JsonParser) parser = json_parser_new ();
 * 
 * // str is defined elsewhere
 * json_parser_load_from_data (parser, str, -1, NULL);
 * 
 * g_autoptr(JsonReader) reader = json_reader_new (json_parser_get_root (parser));
 * 
 * json_reader_read_member (reader, "url");
 *   const char *url = json_reader_get_string_value (reader);
 *   json_reader_end_member (reader);
 * 
 * json_reader_read_member (reader, "size");
 *   json_reader_read_element (reader, 0);
 *     int width = json_reader_get_int_value (reader);
 *     json_reader_end_element (reader);
 *   json_reader_read_element (reader, 1);
 *     int height = json_reader_get_int_value (reader);
 *     json_reader_end_element (reader);
 *   json_reader_end_member (reader);
 * ```
 * 
 * ## Error handling
 * 
 * In case of error, `JsonReader` will be set in an error state; all subsequent
 * calls will simply be ignored until a function that resets the error state is
 * called, e.g.:
 * 
 * ```c
 * // ask for the 7th element; if the element does not exist, the
 * // reader will be put in an error state
 * json_reader_read_element (reader, 6);
 * 
 * // in case of error, this will return NULL, otherwise it will
 * // return the value of the element
 * str = json_reader_get_string_value (value);
 * 
 * // this function resets the error state if any was set
 * json_reader_end_element (reader);
 * ```
 * 
 * If you want to detect the error state as soon as possible, you can use
 * [method@Json.Reader.get_error]:
 * 
 * ```c
 * // like the example above, but in this case we print out the
 * // error immediately
 * if (!json_reader_read_element (reader, 6))
 *   {
 *     const GError *error = json_reader_get_error (reader);
 *     g_print ("Unable to read the element: %s", error->message);
 *   }
 * ```
 *
 */
@interface OGJsonReader : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithNode:(JsonNode*)node;

/**
 * Methods
 */

- (JsonReader*)castedGObject;

/**
 * Counts the elements of the current position, if the reader is
 * positioned on an array.
 * 
 * In case of failure, the reader is set to an error state.
 *
 * @return the number of elements, or -1.
 */
- (gint)countElements;

/**
 * Counts the members of the current position, if the reader is
 * positioned on an object.
 * 
 * In case of failure, the reader is set to an error state.
 *
 * @return the number of members, or -1
 */
- (gint)countMembers;

/**
 * Moves the cursor back to the previous node after being positioned
 * inside an array.
 * 
 * This function resets the error state of the reader, if any was set.
 *
 */
- (void)endElement;

/**
 * Moves the cursor back to the previous node after being positioned
 * inside an object.
 * 
 * This function resets the error state of the reader, if any was set.
 *
 */
- (void)endMember;

/**
 * Retrieves the boolean value of the current position of the reader.
 * 
 * See also: [method@Json.Reader.get_value]
 *
 * @return the boolean value
 */
- (bool)booleanValue;

/**
 * Retrieves the reader node at the current position.
 *
 * @return the current node of the reader
 */
- (JsonNode*)currentNode;

/**
 * Retrieves the floating point value of the current position of the reader.
 * 
 * See also: [method@Json.Reader.get_value]
 *
 * @return the floating point value
 */
- (gdouble)doubleValue;

/**
 * Retrieves the error currently set on the reader.
 *
 * @return the current error
 */
- (const GError*)error;

/**
 * Retrieves the integer value of the current position of the reader.
 * 
 * See also: [method@Json.Reader.get_value]
 *
 * @return the integer value
 */
- (gint64)intValue;

/**
 * Retrieves the name of the current member.
 * 
 * In case of failure, the reader is set to an error state.
 *
 * @return the name of the member
 */
- (OFString*)memberName;

/**
 * Checks whether the value of the current position of the reader is `null`.
 * 
 * See also: [method@Json.Reader.get_value]
 *
 * @return `TRUE` if `null` is set, and `FALSE` otherwise
 */
- (bool)nullValue;

/**
 * Retrieves the string value of the current position of the reader.
 * 
 * See also: [method@Json.Reader.get_value]
 *
 * @return the string value
 */
- (OFString*)stringValue;

/**
 * Retrieves the value node at the current position of the reader.
 * 
 * If the current position does not contain a scalar value, the reader
 * is set to an error state.
 *
 * @return the current value node
 */
- (JsonNode*)value;

/**
 * Checks whether the reader is currently on an array.
 *
 * @return `TRUE` if the reader is on an array
 */
- (bool)isArray;

/**
 * Checks whether the reader is currently on an object.
 *
 * @return `TRUE` if the reader is on an object
 */
- (bool)isObject;

/**
 * Checks whether the reader is currently on a value.
 *
 * @return `TRUE` if the reader is on a value
 */
- (bool)isValue;

/**
 * Retrieves a list of member names from the current position, if the reader
 * is positioned on an object.
 * 
 * In case of failure, the reader is set to an error state.
 *
 * @return the members of
 *   the object
 */
- (gchar**)listMembers;

/**
 * Advances the cursor of the reader to the element of the array or
 * the member of the object at the given position.
 * 
 * You can use [method@Json.Reader.get_value] and its wrapper functions to
 * retrieve the value of the element; for instance, the following code will
 * read the first element of the array at the current cursor position:
 * 
 * ```c
 * json_reader_read_element (reader, 0);
 * int_value = json_reader_get_int_value (reader);
 * ```
 * 
 * After reading the value, you should call [method@Json.Reader.end_element]
 * to reposition the cursor inside the reader, e.g.:
 * 
 * ```c
 * const char *str_value = NULL;
 * 
 * json_reader_read_element (reader, 1);
 * str_value = json_reader_get_string_value (reader);
 * json_reader_end_element (reader);
 * 
 * json_reader_read_element (reader, 2);
 * str_value = json_reader_get_string_value (reader);
 * json_reader_end_element (reader);
 * ```
 * 
 * If the reader is not currently on an array or an object, or if the index is
 * bigger than the size of the array or the object, the reader will be
 * put in an error state until [method@Json.Reader.end_element] is called. This
 * means that, if used conditionally, [method@Json.Reader.end_element] must be
 * called on all branches:
 * 
 * ```c
 * if (!json_reader_read_element (reader, 1))
 *   {
 *     g_propagate_error (error, json_reader_get_error (reader));
 *     json_reader_end_element (reader);
 *     return FALSE;
 *   }
 * else
 *   {
 *     const char *str_value = json_reader_get_string_value (reader);
 *     json_reader_end_element (reader);
 * 
 *     // use str_value
 * 
 *     return TRUE;
 *   }
 * ```c
 *
 * @param index the index of the element
 * @return `TRUE` on success, and `FALSE` otherwise
 */
- (bool)readElement:(guint)index;

/**
 * Advances the cursor of the reader to the `member_name` of the object at
 * the current position.
 * 
 * You can use [method@Json.Reader.get_value] and its wrapper functions to
 * retrieve the value of the member; for instance:
 * 
 * ```c
 * json_reader_read_member (reader, "width");
 * width = json_reader_get_int_value (reader);
 * ```
 * 
 * After reading the value, `json_reader_end_member()` should be called to
 * reposition the cursor inside the reader, e.g.:
 * 
 * ```c
 * json_reader_read_member (reader, "author");
 * author = json_reader_get_string_value (reader);
 * json_reader_end_member (reader);
 * 
 * json_reader_read_member (reader, "title");
 * title = json_reader_get_string_value (reader);
 * json_reader_end_member (reader);
 * ```
 * 
 * If the reader is not currently on an object, or if the `member_name` is not
 * defined in the object, the reader will be put in an error state until
 * [method@Json.Reader.end_member] is called. This means that if used
 * conditionally, [method@Json.Reader.end_member] must be called on all branches:
 * 
 * ```c
 * if (!json_reader_read_member (reader, "title"))
 *   {
 *     g_propagate_error (error, json_reader_get_error (reader));
 *     json_reader_end_member (reader);
 *     return FALSE;
 *   }
 * else
 *   {
 *     const char *str_value = json_reader_get_string_value (reader);
 *     json_reader_end_member (reader);
 * 
 *     // use str_value
 * 
 *     return TRUE;
 *   }
 * ```
 *
 * @param memberName the name of the member to read
 * @return `TRUE` on success, and `FALSE` otherwise
 */
- (bool)readMember:(OFString*)memberName;

/**
 * Sets the root node of the JSON tree to be read by @reader.
 * 
 * The reader will take a copy of the node.
 *
 * @param root the root node
 */
- (void)setRoot:(JsonNode*)root;

@end