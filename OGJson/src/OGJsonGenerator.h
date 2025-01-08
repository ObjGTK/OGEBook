/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <json-glib/json-glib.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGOutputStream;

/**
 * `JsonGenerator` provides an object for generating a JSON data stream
 * from a tree of [struct@Json.Node] instances, and put it into a buffer
 * or a file.
 *
 */
@interface OGJsonGenerator : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)init;

/**
 * Methods
 */

- (JsonGenerator*)castedGObject;

/**
 * Retrieves the value set using [method@Json.Generator.set_indent].
 *
 * @return the number of repetitions per indentation level
 */
- (guint)indent;

/**
 * Retrieves the value set using [method@Json.Generator.set_indent_char].
 *
 * @return the character to be used when indenting
 */
- (gunichar)indentChar;

/**
 * Retrieves the value set using [method@Json.Generator.set_pretty].
 *
 * @return `TRUE` if the generated JSON should be pretty-printed, and
 *   `FALSE` otherwise
 */
- (bool)pretty;

/**
 * Retrieves a pointer to the root node set using
 * [method@Json.Generator.set_root].
 *
 * @return the root node
 */
- (JsonNode*)root;

/**
 * Sets the number of repetitions for each indentation level.
 *
 * @param indentLevel the number of repetitions of the indentation character
 *   that should be applied when pretty printing
 */
- (void)setIndent:(guint)indentLevel;

/**
 * Sets the character to be used when indenting.
 *
 * @param indentChar a Unicode character to be used when indenting
 */
- (void)setIndentChar:(gunichar)indentChar;

/**
 * Sets whether the generated JSON should be pretty printed.
 * 
 * Pretty printing will use indentation character specified in the
 * [property@Json.Generator:indent-char] property and the spacing
 * specified in the [property@Json.Generator:indent] property.
 *
 * @param isPretty whether the generated string should be pretty printed
 */
- (void)setPretty:(bool)isPretty;

/**
 * Sets the root of the JSON data stream to be serialized by
 * the given generator.
 * 
 * The passed `node` is copied by the generator object, so it can be
 * safely freed after calling this function.
 *
 * @param node the root node
 */
- (void)setRoot:(JsonNode*)node;

/**
 * Generates a JSON data stream from @generator and returns it as a
 * buffer.
 *
 * @param length return location for the length of the returned
 *   buffer
 * @return a newly allocated string holding a JSON data stream
 */
- (OFString*)toData:(gsize*)length;

/**
 * Creates a JSON data stream and puts it inside `filename`, overwriting
 * the file's current contents.
 * 
 * This operation is atomic, in the sense that the data is written to a
 * temporary file which is then renamed to the given `filename`.
 *
 * @param filename the path to the target file
 * @return %TRUE if saving was successful.
 */
- (bool)toFile:(OFString*)filename;

/**
 * Generates a JSON data stream and appends it to the string buffer.
 *
 * @param string a string buffer
 * @return the passed string, updated with
 *   the generated JSON data
 */
- (GString*)toGstring:(GString*)string;

/**
 * Outputs JSON data and writes it (synchronously) to the given stream.
 *
 * @param stream the output stream used to write the JSON data
 * @param cancellable a `GCancellable`
 * @return whether the write operation was successful
 */
- (bool)toStreamWithStream:(OGOutputStream*)stream cancellable:(OGCancellable*)cancellable;

@end