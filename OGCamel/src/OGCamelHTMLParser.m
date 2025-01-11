/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelHTMLParser.h"

@implementation OGCamelHTMLParser

+ (void)load
{
	GType gtypeToAssociate = CAMEL_TYPE_HTML_PARSER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)hTMLParser
{
	CamelHTMLParser* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(camel_html_parser_new(), CamelHTMLParser, CamelHTMLParser);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGCamelHTMLParser* wrapperObject;
	@try {
		wrapperObject = [[OGCamelHTMLParser alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (CamelHTMLParser*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], CamelHTMLParser, CamelHTMLParser);
}

- (OFString*)attr:(OFString*)name
{
	const gchar* gobjectValue = camel_html_parser_attr([self castedGObject], [name UTF8String]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (const GPtrArray*)attrList:(const GPtrArray**)values
{
	const GPtrArray* returnValue = (const GPtrArray*)camel_html_parser_attr_list([self castedGObject], values);

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
	CamelHTMLParserState returnValue = (CamelHTMLParserState)camel_html_parser_step([self castedGObject], datap, lenp);

	return returnValue;
}

- (OFString*)tag
{
	const gchar* gobjectValue = camel_html_parser_tag([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end