/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <libedataserver/libedataserver.h>

#import <OGObject/OGObject.h>

/**
 * Contains only private data that should be read and manipulated using the
 * functions below.
 *
 */
@interface OGEXmlDocument : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithNsHref:(OFString*)nsHref rootElement:(OFString*)rootElement;

/**
 * Methods
 */

- (EXmlDocument*)castedGObject;

/**
 * Adds a new attribute to the current element.
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 *
 * @param nsHref optional namespace href for the new attribute, or %NULL
 * @param name name of the attribute
 * @param value value of the attribute
 */
- (void)addAttributeWithNsHref:(OFString*)nsHref name:(OFString*)name value:(OFString*)value;

/**
 * Adds a new attribute with a double value to the current element.
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 *
 * @param nsHref optional namespace href for the new attribute, or %NULL
 * @param name name of the attribute
 * @param value double value of the attribute
 */
- (void)addAttributeDoubleWithNsHref:(OFString*)nsHref name:(OFString*)name value:(gdouble)value;

/**
 * Adds a new attribute with an integer value to the current element.
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 *
 * @param nsHref optional namespace href for the new attribute, or %NULL
 * @param name name of the attribute
 * @param value integer value of the attribute
 */
- (void)addAttributeIntWithNsHref:(OFString*)nsHref name:(OFString*)name value:(gint64)value;

/**
 * Adds a new attribute with a time_t value in ISO 8601 format to the current element.
 * The format is "YYYY-MM-DDTHH:MM:SSZ".
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 *
 * @param nsHref optional namespace href for the new attribute, or %NULL
 * @param name name of the attribute
 * @param value time_t value of the attribute
 */
- (void)addAttributeTimeWithNsHref:(OFString*)nsHref name:(OFString*)name value:(time_t)value;

/**
 * Adds a new attribute with a time_t value in iCalendar format to the current element.
 * The format is "YYYYMMDDTHHMMSSZ".
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 *
 * @param nsHref optional namespace href for the new attribute, or %NULL
 * @param name name of the attribute
 * @param value time_t value of the attribute
 */
- (void)addAttributeTimeIcalWithNsHref:(OFString*)nsHref name:(OFString*)name value:(time_t)value;

/**
 * Adds an empty element, which is an element with no attribute and no value.
 * 
 * It's the same as calling e_xml_document_start_element() immediately
 * followed by e_xml_document_end_element().
 *
 * @param nsHref optional namespace href for the new element, or %NULL
 * @param name name of the new element
 */
- (void)addEmptyElementWithNsHref:(OFString*)nsHref name:(OFString*)name;

/**
 * This is a pair function for e_xml_document_start_element() and
 * e_xml_document_start_text_element(), which changes current
 * element to the parent of that element.
 *
 */
- (void)endElement;

/**
 * Gets content of the @xml as string. The string is nul-terminated, but
 * if @out_length is also provided, then it doesn't contain this additional
 * nul character.
 *
 * @param outLength optional return location for length of the content, or %NULL
 * @return Content of the @xml as newly allocated string.
 *    Free it with g_free(), when no longer needed.
 */
- (OFString*)content:(gsize*)outLength;

/**
 *
 * @return Underlying #xmlDocPtr.
 */
- (xmlDoc*)xmldoc;

/**
 * Starts a new non-text element as a child of the current element.
 * Each such call should be ended with corresponding e_xml_document_end_element().
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 * 
 * To start a text node use e_xml_document_start_text_element().
 *
 * @param nsHref optional namespace href for the new element, or %NULL
 * @param name name of the new element
 */
- (void)startElementWithNsHref:(OFString*)nsHref name:(OFString*)name;

/**
 * Starts a new text element as a child of the current element.
 * Each such call should be ended with corresponding e_xml_document_end_element().
 * Use %NULL @ns_href, to use the default namespace, otherwise either previously
 * added namespace with the same href from e_xml_document_add_namespaces() is picked,
 * or a new namespace with generated prefix is added.
 * 
 * To start a non-text node use e_xml_document_start_element().
 *
 * @param nsHref optional namespace href for the new element, or %NULL
 * @param name name of the new element
 */
- (void)startTextElementWithNsHref:(OFString*)nsHref name:(OFString*)name;

/**
 * Writes @value of length @len, encoded to base64, as content of the current element.
 *
 * @param value value to write as the content
 * @param len length of @value
 */
- (void)writeBase64WithValue:(OFString*)value len:(gint)len;

/**
 * Writes @value of length @len as content of the current element.
 *
 * @param value value to write as the content
 * @param len length of @value
 */
- (void)writeBufferWithValue:(OFString*)value len:(gint)len;

/**
 * Writes @value as content of the current element.
 *
 * @param value value to write as the content
 */
- (void)writeDouble:(gdouble)value;

/**
 * Writes @value as content of the current element.
 *
 * @param value value to write as the content
 */
- (void)writeInt:(gint64)value;

/**
 * Writes @value as content of the current element.
 *
 * @param value value to write as the content
 */
- (void)writeString:(OFString*)value;

/**
 * Writes @value in ISO 8601 format as content of the current element.
 * The format is "YYYY-MM-DDTHH:MM:SSZ".
 *
 * @param value value to write as the content
 */
- (void)writeTime:(time_t)value;

@end