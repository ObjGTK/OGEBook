/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGEXmlDocument.h"

@implementation OGEXmlDocument

- (instancetype)initWithNsHref:(OFString*)nsHref rootElement:(OFString*)rootElement
{
	EXmlDocument* gobjectValue = E_XML_DOCUMENT(e_xml_document_new([nsHref UTF8String], [rootElement UTF8String]));

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

- (EXmlDocument*)castedGObject
{
	return E_XML_DOCUMENT([self gObject]);
}

- (void)addAttributeWithNsHref:(OFString*)nsHref name:(OFString*)name value:(OFString*)value
{
	e_xml_document_add_attribute([self castedGObject], [nsHref UTF8String], [name UTF8String], [value UTF8String]);
}

- (void)addAttributeDoubleWithNsHref:(OFString*)nsHref name:(OFString*)name value:(gdouble)value
{
	e_xml_document_add_attribute_double([self castedGObject], [nsHref UTF8String], [name UTF8String], value);
}

- (void)addAttributeIntWithNsHref:(OFString*)nsHref name:(OFString*)name value:(gint64)value
{
	e_xml_document_add_attribute_int([self castedGObject], [nsHref UTF8String], [name UTF8String], value);
}

- (void)addAttributeTimeWithNsHref:(OFString*)nsHref name:(OFString*)name value:(time_t)value
{
	e_xml_document_add_attribute_time([self castedGObject], [nsHref UTF8String], [name UTF8String], value);
}

- (void)addAttributeTimeIcalWithNsHref:(OFString*)nsHref name:(OFString*)name value:(time_t)value
{
	e_xml_document_add_attribute_time_ical([self castedGObject], [nsHref UTF8String], [name UTF8String], value);
}

- (void)addEmptyElementWithNsHref:(OFString*)nsHref name:(OFString*)name
{
	e_xml_document_add_empty_element([self castedGObject], [nsHref UTF8String], [name UTF8String]);
}

- (void)endElement
{
	e_xml_document_end_element([self castedGObject]);
}

- (OFString*)content:(gsize*)outLength
{
	gchar* gobjectValue = e_xml_document_get_content([self castedGObject], outLength);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}

- (xmlDoc*)xmldoc
{
	xmlDoc* returnValue = e_xml_document_get_xmldoc([self castedGObject]);

	return returnValue;
}

- (void)startElementWithNsHref:(OFString*)nsHref name:(OFString*)name
{
	e_xml_document_start_element([self castedGObject], [nsHref UTF8String], [name UTF8String]);
}

- (void)startTextElementWithNsHref:(OFString*)nsHref name:(OFString*)name
{
	e_xml_document_start_text_element([self castedGObject], [nsHref UTF8String], [name UTF8String]);
}

- (void)writeBase64WithValue:(OFString*)value len:(gint)len
{
	e_xml_document_write_base64([self castedGObject], [value UTF8String], len);
}

- (void)writeBufferWithValue:(OFString*)value len:(gint)len
{
	e_xml_document_write_buffer([self castedGObject], [value UTF8String], len);
}

- (void)writeDouble:(gdouble)value
{
	e_xml_document_write_double([self castedGObject], value);
}

- (void)writeInt:(gint64)value
{
	e_xml_document_write_int([self castedGObject], value);
}

- (void)writeString:(OFString*)value
{
	e_xml_document_write_string([self castedGObject], [value UTF8String]);
}

- (void)writeTime:(time_t)value
{
	e_xml_document_write_time([self castedGObject], value);
}


@end