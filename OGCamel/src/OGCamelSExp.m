/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
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

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_sexp_new()];

	return self;
}

- (CamelSExp*)SEXP
{
	return CAMEL_SEXP([self GOBJECT]);
}

- (void)addFunctionWithScope:(guint)scope name:(OFString*)name func:(CamelSExpFunc)func userData:(gpointer)userData
{
	camel_sexp_add_function([self SEXP], scope, [name UTF8String], func, userData);
}

- (void)addIfunctionWithScope:(guint)scope name:(OFString*)name ifunc:(CamelSExpIFunc)ifunc userData:(gpointer)userData
{
	camel_sexp_add_ifunction([self SEXP], scope, [name UTF8String], ifunc, userData);
}

- (void)addVariableWithScope:(guint)scope name:(OFString*)name value:(CamelSExpTerm*)value
{
	camel_sexp_add_variable([self SEXP], scope, [name UTF8String], value);
}

- (OFString*)error
{
	return [OFString stringWithUTF8String:camel_sexp_error([self SEXP])];
}

- (CamelSExpResult*)eval
{
	return camel_sexp_eval([self SEXP]);
}

- (bool)evaluateOccurTimesWithStart:(time_t*)start end:(time_t*)end
{
	return camel_sexp_evaluate_occur_times([self SEXP], start, end);
}

- (void)inputFile:(gint)fd
{
	camel_sexp_input_file([self SEXP], fd);
}

- (void)inputTextWithText:(OFString*)text len:(gint)len
{
	camel_sexp_input_text([self SEXP], [text UTF8String], len);
}

- (gint)parse
{
	return camel_sexp_parse([self SEXP]);
}

- (CamelSExpTerm*)parseValue
{
	return camel_sexp_parse_value([self SEXP]);
}

- (void)removeSymbolWithScope:(guint)scope name:(OFString*)name
{
	camel_sexp_remove_symbol([self SEXP], scope, [name UTF8String]);
}

- (void)resultFree:(CamelSExpResult*)result
{
	camel_sexp_result_free([self SEXP], result);
}

- (CamelSExpResult*)resultNew:(gint)type
{
	return camel_sexp_result_new([self SEXP], type);
}

- (void)resultvFreeWithArgc:(gint)argc argv:(CamelSExpResult**)argv
{
	camel_sexp_resultv_free([self SEXP], argc, argv);
}

- (gint)setScope:(guint)scope
{
	return camel_sexp_set_scope([self SEXP], scope);
}

- (CamelSExpResult*)termEval:(CamelSExpTerm*)term
{
	return camel_sexp_term_eval([self SEXP], term);
}


@end