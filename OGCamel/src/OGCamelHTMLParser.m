/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelHTMLParser.h"

@implementation OGCamelHTMLParser

- (instancetype)init
{
	CamelHTMLParser* gobjectValue = CAMEL_HTML_PARSER(camel_html_parser_new());

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

- (CamelHTMLParser*)castedGObject
{
	return CAMEL_HTML_PARSER([self gObject]);
}

- (OFString*)attr:(OFString*)name
{
	const gchar* gobjectValue = camel_html_parser_attr([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GPtrArray*)attrList:(const GPtrArray**)values
{
	const GPtrArray* returnValue = camel_html_parser_attr_list([self castedGObject], values);

	return returnValue;
}

- (OFString*)left:(gint*)lenp
{
	const gchar* gobjectValue = camel_html_parser_left([self castedGObject], lenp);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setDataWithStart:(OFString*)start len:(gint)len last:(gint)last
{
	camel_html_parser_set_data([self castedGObject], [start UTF8String], len, last);
}

- (CamelHTMLParserState)stepWithDatap:(const gchar**)datap lenp:(gint*)lenp
{
	CamelHTMLParserState returnValue = camel_html_parser_step([self castedGObject], datap, lenp);

	return returnValue;
}

- (OFString*)tag
{
	const gchar* gobjectValue = camel_html_parser_tag([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end