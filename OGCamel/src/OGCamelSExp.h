/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelSExp : OGObject
{

}

/**
 * Functions
 */
+ (void)load;


/**
 * Encode a bool into an s-expression @string.  Bools are
 * encoded using #t #f syntax.
 *
 * @param string Destination #GString
 * @param vbool the value
 */
+ (void)encodeBoolWithString:(GString*)string vbool:(bool)vbool;

/**
 * Add a c string @v_string to the s-expression stored in
 * the gstring @s.  Quotes are added, and special characters
 * are escaped appropriately.
 *
 * @param string Destination #GString
 * @param vstring String expression.
 */
+ (void)encodeString:(GString*)string vstring:(OFString*)vstring;

/**
 * Constructors
 */
+ (instancetype)sExp;

/**
 * Methods
 */

- (CamelSExp*)castedGObject;

/**
 * Adds a function symbol which can not perform short evaluation.
 * Use camel_sexp_add_ifunction() for functions which can.
 *
 * @param scope a scope
 * @param name a function name
 * @param func a function callback
 * @param userData user data for @func
 */
- (void)addFunctionWithScope:(guint)scope name:(OFString*)name func:(CamelSExpFunc)func userData:(gpointer)userData;

/**
 * Adds a function symbol which can perform short evaluation,
 * or doesn't execute everything. Use camel_sexp_add_function()
 * for any other types of the function symbols.
 *
 * @param scope a scope
 * @param name a function name
 * @param ifunc a function callback
 * @param userData user data for @ifunc
 */
- (void)addIfunctionWithScope:(guint)scope name:(OFString*)name ifunc:(CamelSExpIFunc)ifunc userData:(gpointer)userData;

/**
 * Adds a variable named @name to the given @scope, set to the given @value.
 *
 * @param scope a scope
 * @param name a variable name
 * @param value a variable value, as a #CamelSExpTerm
 */
- (void)addVariableWithScope:(guint)scope name:(OFString*)name value:(CamelSExpTerm*)value;

/**
 *
 * @return Set error string on the @sexp, or %NULL, when none is set
 */
- (OFString*)error;

/**
 *
 * @return
 */
- (CamelSExpResult*)eval;

/**
 *
 * @param start
 * @param end
 * @return
 */
- (bool)evaluateOccurTimesWithStart:(time_t*)start end:(time_t*)end;

/**
 * Prepares to scan a file.
 *
 * @param fd a file descriptor
 */
- (void)inputFileWithFd:(gint)fd;

/**
 * Prepares to scan a text buffer.
 *
 * @param text a text buffer to scan
 * @param len the length of the text buffer
 */
- (void)inputText:(OFString*)text len:(gint)len;

/**
 *
 * @return
 */
- (gint)parse;

/**
 *
 * @return a #CamelSExpTerm of the next token, or %NULL when there is none.
 */
- (CamelSExpTerm*)parseValue;

/**
 * Revoes a symbol from a scope.
 *
 * @param scope a scope
 * @param name a symbol name
 */
- (void)removeSymbolWithScope:(guint)scope name:(OFString*)name;

/**
 * Frees the @result and its internal data. Does nothing,
 * when the @result is %NULL.
 *
 * @param result a #CamelSExpResult to free
 */
- (void)resultFreeWithResult:(CamelSExpResult*)result;

/**
 *
 * @param type type of the result, one of #CamelSExpResultType
 * @return A new #CamelSExpResult result structure, associated with @sexp.
 *    Free with camel_sexp_result_free(), when no longer needed.
 */
- (CamelSExpResult*)resultNewWithType:(gint)type;

/**
 * Frees an array of results.
 *
 * @param argc a count of the @argv
 * @param argv an array of #CamelSExpResult to free
 */
- (void)resultvFreeWithArgc:(gint)argc argv:(CamelSExpResult**)argv;

/**
 * sets the current scope for the scanner.
 *
 * @param scope a scope to set
 * @return the previous scope id
 */
- (gint)setScope:(guint)scope;

/**
 * Evaluates a part of the expression.
 *
 * @param term a #CamelSExpTerm to evaluate
 * @return a newly allocated result of the evaluation. Free
 *    the returned pointer with camel_sexp_result_free(), when no longer needed.
 */
- (CamelSExpResult*)termEvalWithTerm:(CamelSExpTerm*)term;

@end