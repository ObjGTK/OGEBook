/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <json-glib/json-glib.h>

#import <OGObject/OGObject.h>

/**
 * `JsonPath` is a simple class implementing the JSONPath syntax for extracting
 * data out of a JSON tree.
 * 
 * While the semantics of the JSONPath expressions are heavily borrowed by the
 * XPath specification for XML, the syntax follows the ECMAScript origins of
 * JSON.
 * 
 * Once a `JsonPath` instance has been created, it has to compile a JSONPath
 * expression using [method@Json.Path.compile] before being able to match it to
 * a JSON tree; the same `JsonPath` instance can be used to match multiple JSON
 * trees. It it also possible to compile a new JSONPath expression using the
 * same `JsonPath` instance; the previous expression will be discarded only if
 * the compilation of the new expression is successful.
 * 
 * The simple convenience function [func@Json.Path.query] can be used for
 * one-off matching.
 * 
 * ## Syntax of the JSONPath expressions
 * 
 * A JSONPath expression is composed by path indices and operators.
 * Each path index can either be a member name or an element index inside
 * a JSON tree. A JSONPath expression must start with the `$` operator; each
 * path index is separated using either the dot notation or the bracket
 * notation, e.g.:
 * 
 * ```
 * // dot notation
 * $.store.book[0].title
 * 
 * // bracket notation
 * $['store']['book'][0]['title']
 * ```
 * 
 * The available operators are:
 * 
 * * The `$` character represents the root node of the JSON tree, and
 *   matches the entire document.
 * 
 * * Child nodes can either be matched using `.` or `[]`. For instance,
 *   both `$.store.book` and `$['store']['book']` match the contents of
 *   the book member of the store object.
 * 
 * * Child nodes can be reached without specifying the whole tree structure
 *   through the recursive descent operator, or `..`. For instance,
 *   `$..author` matches all author member in every object.
 * 
 * * Child nodes can grouped through the wildcard operator, or `*`. For
 *   instance, `$.store.book[*].author` matches all author members of any
 *   object element contained in the book array of the store object.
 * 
 * * Element nodes can be accessed using their index (starting from zero)
 *   in the subscript operator `[]`. For instance, `$.store.book[0]` matches
 *   the first element of the book array of the store object.
 * 
 * * Subsets of element nodes can be accessed using the set notation
 *   operator `[i,j,...]`. For instance, `$.store.book[0,2]` matches the
 *   elements 0 and 2 (the first and third) of the book array of the store
 *   object.
 * 
 * * Slices of element nodes can be accessed using the slice notation
 *   operation `[start:end:step]`. If start is omitted, the starting index
 *   of the slice is implied to be zero; if end is omitted, the ending index
 *   of the slice is implied to be the length of the array; if step is
 *   omitted, the step of the slice is implied to be 1. For instance,
 *   `$.store.book[:2]` matches the first two elements of the book array
 *   of the store object.
 * 
 * More information about JSONPath is available on Stefan Gössner's
 * [JSONPath website](http://goessner.net/articles/JsonPath/).
 * 
 * ## Example of JSONPath matches
 * 
 * The following example shows some of the results of using `JsonPath`
 * on a JSON tree. We use the following JSON description of a bookstore:
 * 
 * ```json
 * { "store": {
 *     "book": [
 *       { "category": "reference", "author": "Nigel Rees",
 *         "title": "Sayings of the Century", "price": "8.95"  },
 *       { "category": "fiction", "author": "Evelyn Waugh",
 *         "title": "Sword of Honour", "price": "12.99" },
 *       { "category": "fiction", "author": "Herman Melville",
 *         "title": "Moby Dick", "isbn": "0-553-21311-3",
 *         "price": "8.99" },
 *       { "category": "fiction", "author": "J. R. R. Tolkien",
 *         "title": "The Lord of the Rings", "isbn": "0-395-19395-8",
 *         "price": "22.99" }
 *     ],
 *     "bicycle": { "color": "red", "price": "19.95" }
 *   }
 * }
 * ```
 * 
 * We can parse the JSON using [class@Json.Parser]:
 * 
 * ```c
 * JsonParser *parser = json_parser_new ();
 * json_parser_load_from_data (parser, json_data, -1, NULL);
 * ```
 * 
 * If we run the following code:
 * 
 * ```c
 * JsonNode *result;
 * JsonPath *path = json_path_new ();
 * json_path_compile (path, "$.store..author", NULL);
 * result = json_path_match (path, json_parser_get_root (parser));
 * ```
 * 
 * The `result` node will contain an array with all values of the
 * author member of the objects in the JSON tree. If we use a
 * [class@Json.Generator] to convert the `result` node to a string
 * and print it:
 * 
 * ```c
 * JsonGenerator *generator = json_generator_new ();
 * json_generator_set_root (generator, result);
 * char *str = json_generator_to_data (generator, NULL);
 * g_print ("Results: %s\n", str);
 * ```
 * 
 * The output will be:
 * 
 * ```json
 * ["Nigel Rees","Evelyn Waugh","Herman Melville","J. R. R. Tolkien"]
 * ```
 *
 */
@interface OGJsonPath : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Queries a JSON tree using a JSONPath expression.
 * 
 * This function is a simple wrapper around [ctor@Json.Path.new],
 * [method@Json.Path.compile], and [method@Json.Path.match]. It implicitly
 * creates a `JsonPath` instance, compiles the given expression and matches
 * it against the JSON tree pointed by `root`.
 *
 * @param expression a JSONPath expression
 * @param root the root of a JSON tree
 * @return a newly-created node of type
 *   `JSON_NODE_ARRAY` containing the array of matching nodes
 */
+ (JsonNode*)queryWithExpression:(OFString*)expression root:(JsonNode*)root;

/**
 * Constructors
 */
+ (instancetype)path;

/**
 * Methods
 */

- (JsonPath*)castedGObject;

/**
 * Validates and decomposes the given expression.
 * 
 * A JSONPath expression must be compiled before calling
 * [method@Json.Path.match].
 *
 * @param expression a JSONPath expression
 * @return `TRUE` if the compilation was successful, and `FALSE`
 *   otherwise
 */
- (bool)compileWithExpression:(OFString*)expression;

/**
 * Matches the JSON tree pointed by `root` using the expression compiled
 * into the `JsonPath`.
 * 
 * The nodes matching the expression will be copied into an array.
 *
 * @param root the root node of the JSON data to match
 * @return a newly-created node of type
 *   `JSON_NODE_ARRAY` containing the array of matching nodes
 */
- (JsonNode*)matchWithRoot:(JsonNode*)root;

@end