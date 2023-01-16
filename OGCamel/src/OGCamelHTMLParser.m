/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2022 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelHTMLParser.h"

@implementation OGCamelHTMLParser

- (instancetype)init
{
	self = [super initWithGObject:(GObject*)camel_html_parser_new()];

	return self;
}

- (CamelHTMLParser*)HTMLPARSER
{
	return CAMEL_HTML_PARSER([self GOBJECT]);
}

- (OFString*)attr:(OFString*)name
{
	return [OFString stringWithUTF8String:camel_html_parser_attr([self HTMLPARSER], [name UTF8String])];
}

- (const GPtrArray*)attrList:(const GPtrArray**)values
{
	return camel_html_parser_attr_list([self HTMLPARSER], values);
}

- (OFString*)left:(gint*)lenp
{
	return [OFString stringWithUTF8String:camel_html_parser_left([self HTMLPARSER], lenp)];
}

- (void)setDataWithStart:(OFString*)start len:(gint)len last:(gint)last
{
	camel_html_parser_set_data([self HTMLPARSER], [start UTF8String], len, last);
}

- (CamelHTMLParserState)stepWithDatap:(const gchar**)datap lenp:(gint*)lenp
{
	return camel_html_parser_step([self HTMLPARSER], datap, lenp);
}

- (OFString*)tag
{
	return [OFString stringWithUTF8String:camel_html_parser_tag([self HTMLPARSER])];
}


@end