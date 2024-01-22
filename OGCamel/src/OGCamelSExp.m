/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelSExp.h"

@implementation OGCamelSExp

+ (void)encodeBoolWithString:(GString*)string vbool:(bool)vbool
{
	camel_sexp_encode_bool(string, vbool);
}

+ (void)encodeStringWithString:(GString*)string vstring:(OFString*)vstring
{
	camel_sexp_encode_string(string, [vstring UTF8String]);
}

+ (OFString*)toSqlSexp:(OFString*)sexp
{
	gchar* gobjectValue = camel_sexp_to_sql_sexp([sexp UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (instancetype)init
{
	CamelSExp* gobjectValue = CAMEL_SEXP(camel_sexp_new());

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

- (CamelSExp*)castedGObject
{
	return CAMEL_SEXP([self gObject]);
}

- (void)addFunctionWithScope:(guint)scope name:(OFString*)name func:(CamelSExpFunc)func userData:(gpointer)userData
{
	camel_sexp_add_function([self castedGObject], scope, [name UTF8String], func, userData);
}

- (void)addIfunctionWithScope:(guint)scope name:(OFString*)name ifunc:(CamelSExpIFunc)ifunc userData:(gpointer)userData
{
	camel_sexp_add_ifunction([self castedGObject], scope, [name UTF8String], ifunc, userData);
}

- (void)addVariableWithScope:(guint)scope name:(OFString*)name value:(CamelSExpTerm*)value
{
	camel_sexp_add_variable([self castedGObject], scope, [name UTF8String], value);
}

- (OFString*)error
{
	const gchar* gobjectValue = camel_sexp_error([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (CamelSExpResult*)eval
{
	CamelSExpResult* returnValue = camel_sexp_eval([self castedGObject]);

	return returnValue;
}

- (bool)evaluateOccurTimesWithStart:(time_t*)start end:(time_t*)end
{
	bool returnValue = camel_sexp_evaluate_occur_times([self castedGObject], start, end);

	return returnValue;
}

- (void)inputFile:(gint)fd
{
	camel_sexp_input_file([self castedGObject], fd);
}

- (void)inputTextWithText:(OFString*)text len:(gint)len
{
	camel_sexp_input_text([self castedGObject], [text UTF8String], len);
}

- (gint)parse
{
	gint returnValue = camel_sexp_parse([self castedGObject]);

	return returnValue;
}

- (CamelSExpTerm*)parseValue
{
	CamelSExpTerm* returnValue = camel_sexp_parse_value([self castedGObject]);

	return returnValue;
}

- (void)removeSymbolWithScope:(guint)scope name:(OFString*)name
{
	camel_sexp_remove_symbol([self castedGObject], scope, [name UTF8String]);
}

- (void)resultFree:(CamelSExpResult*)result
{
	camel_sexp_result_free([self castedGObject], result);
}

- (CamelSExpResult*)resultNew:(gint)type
{
	CamelSExpResult* returnValue = camel_sexp_result_new([self castedGObject], type);

	return returnValue;
}

- (void)resultvFreeWithArgc:(gint)argc argv:(CamelSExpResult**)argv
{
	camel_sexp_resultv_free([self castedGObject], argc, argv);
}

- (gint)setScope:(guint)scope
{
	gint returnValue = camel_sexp_set_scope([self castedGObject], scope);

	return returnValue;
}

- (CamelSExpResult*)termEval:(CamelSExpTerm*)term
{
	CamelSExpResult* returnValue = camel_sexp_term_eval([self castedGObject], term);

	return returnValue;
}


@end