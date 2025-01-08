/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <json-glib/json-glib.h>

#import <OGObject/OGObject.h>

@class OGCancellable;
@class OGInputStream;

/**
 * `JsonParser` provides an object for parsing a JSON data stream, either
 * inside a file or inside a static buffer.
 * 
 * ## Using `JsonParser`
 * 
 * The `JsonParser` API is fairly simple:
 * 
 * ```c
 * gboolean
 * parse_json (const char *filename)
 * {
 *   g_autoptr(JsonParser) parser = json_parser_new ();
 *   g_autoptr(GError) error = NULL
 * 
 *   json_parser_load_from_file (parser, filename, &error);
 *   if (error != NULL)
 *     {
 *       g_critical ("Unable to parse '%s': %s", filename, error->message);
 *       return FALSE;
 *     }
 * 
 *   g_autoptr(JsonNode) root = json_parser_get_root (parser);
 * 
 *   // manipulate the object tree from the root node
 * 
 *   return TRUE
 * }
 * ```
 * 
 * By default, the entire process of loading the data and parsing it is
 * synchronous; the [method@Json.Parser.load_from_stream_async()] API will
 * load the data asynchronously, but parse it in the main context as the
 * signals of the parser must be emitted in the same thread. If you do
 * not use signals, and you wish to also parse the JSON data without blocking,
 * you should use a `GTask` and the synchronous `JsonParser` API inside the
 * task itself.
 *
 */
@interface OGJsonParser : OGObject
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

- (JsonParser*)castedGObject;

/**
 * Retrieves the line currently parsed, starting from 1.
 * 
 * This function has defined behaviour only while parsing; calling this
 * function from outside the signal handlers emitted by the parser will
 * yield 0.
 *
 * @return the currently parsed line, or 0.
 */
- (guint)currentLine;

/**
 * Retrieves the current position inside the current line, starting
 * from 0.
 * 
 * This function has defined behaviour only while parsing; calling this
 * function from outside the signal handlers emitted by the parser will
 * yield 0.
 *
 * @return the position in the current line, or 0.
 */
- (guint)currentPos;

/**
 * Retrieves the top level node from the parsed JSON stream.
 * 
 * If the parser input was an empty string, or if parsing failed, the root
 * will be `NULL`. It will also be `NULL` if it has been stolen using
 * [method@Json.Parser.steal_root].
 *
 * @return the root node.
 */
- (JsonNode*)root;

/**
 * A JSON data stream might sometimes contain an assignment, like:
 * 
 * ```
 * var _json_data = { "member_name" : [ ...
 * ```
 * 
 * even though it would technically constitute a violation of the RFC.
 * 
 * `JsonParser` will ignore the left hand identifier and parse the right
 * hand value of the assignment. `JsonParser` will record, though, the
 * existence of the assignment in the data stream and the variable name
 * used.
 *
 * @param variableName the variable name
 * @return `TRUE` if there was an assignment, and `FALSE` otherwise
 */
- (bool)hasAssignment:(gchar**)variableName;

/**
 * Loads a JSON stream from a buffer and parses it.
 * 
 * You can call this function multiple times with the same parser, but the
 * contents of the parser will be destroyed each time.
 *
 * @param data the buffer to parse
 * @param length the length of the buffer, or -1 if it is `NUL` terminated
 * @return `TRUE` if the buffer was succesfully parsed
 */
- (bool)loadFromDataWithData:(OFString*)data length:(gssize)length;

/**
 * Loads a JSON stream from the content of `filename` and parses it.
 * 
 * If the file is large or shared between processes,
 * [method@Json.Parser.load_from_mapped_file] may be a more efficient
 * way to load it.
 * 
 * See also: [method@Json.Parser.load_from_data]
 *
 * @param filename the path for the file to parse
 * @return `TRUE` if the file was successfully loaded and parsed.
 */
- (bool)loadFromFile:(OFString*)filename;

/**
 * Loads a JSON stream from the content of `filename` and parses it.
 * 
 * Unlike [method@Json.Parser.load_from_file], `filename` will be memory
 * mapped as read-only and parsed. `filename` will be unmapped before this
 * function returns.
 * 
 * If mapping or reading the file fails, a `G_FILE_ERROR` will be returned.
 *
 * @param filename the path for the file to parse
 * @return `TRUE` if the file was successfully loaded and parsed.
 */
- (bool)loadFromMappedFile:(OFString*)filename;

/**
 * Loads the contents of an input stream and parses them.
 * 
 * If `cancellable` is not `NULL`, then the operation can be cancelled by
 * triggering the cancellable object from another thread. If the
 * operation was cancelled, `G_IO_ERROR_CANCELLED` will be set
 * on the given `error`.
 *
 * @param stream the input stream with the JSON data
 * @param cancellable a #GCancellable
 * @return `TRUE` if the data stream was successfully read and
 *   parsed, and `FALSE` otherwise
 */
- (bool)loadFromStreamWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable;

/**
 * Asynchronously reads the contents of a stream.
 * 
 * For more details, see [method@Json.Parser.load_from_stream], which is the
 * synchronous version of this call.
 * 
 * When the operation is finished, @callback will be called. You should
 * then call [method@Json.Parser.load_from_stream_finish] to get the result
 * of the operation.
 *
 * @param stream the input stream with the JSON data
 * @param cancellable a #GCancellable
 * @param callback the function to call when the request is satisfied
 * @param userData the data to pass to @callback
 */
- (void)loadFromStreamAsyncWithStream:(OGInputStream*)stream cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData;

/**
 * Finishes an asynchronous stream loading started with
 * [method@Json.Parser.load_from_stream_async].
 *
 * @param result the result of the asynchronous operation
 * @return `TRUE` if the content of the stream was successfully retrieved
 *   and parsed, and `FALSE` otherwise
 */
- (bool)loadFromStreamFinish:(GAsyncResult*)result;

/**
 * Steals the top level node from the parsed JSON stream.
 * 
 * This will be `NULL` in the same situations as [method@Json.Parser.get_root]
 * return `NULL`.
 *
 * @return the root node
 */
- (JsonNode*)stealRoot;

@end