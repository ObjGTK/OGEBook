/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCamelDataWrapper.h"

@interface OGCamelMedium : OGCamelDataWrapper
{

}


/**
 * Methods
 */

- (CamelMedium*)castedGObject;

/**
 * Adds a header to a #CamelMedium.
 *
 * @param name name of the header
 * @param value value of the header
 */
- (void)addHeaderWithName:(OFString*)name value:(OFString*)value;

/**
 * Gets an array of all header name/value pairs. The values will be
 * decoded to UTF-8 for any headers that are recognized by Camel.
 * See also camel_medium_get_headers().
 *
 * @return the array of headers, which must be freed with camel_name_value_array_free().
 */
- (CamelNameValueArray*)dupHeaders;

/**
 * Gets a data wrapper that represents the content of the medium,
 * without its headers.
 *
 * @return a #CamelDataWrapper containing
 * @medium's content. Can return %NULL.
 */
- (OGCamelDataWrapper*)content;

/**
 * Gets the value of the named header in the medium, or %NULL if
 * it is unset. The caller should not modify or free the data.
 * 
 * If the header occurs more than once, only retrieve the first
 * instance of the header.  For multi-occuring headers, use
 * camel_medium_dup_headers() or camel_medium_get_headers().
 *
 * @param name the name of the header
 * @return the value of the named header, or %NULL
 */
- (OFString*)headerWithName:(OFString*)name;

/**
 * Gets an array of all header name/value pairs. The values will be
 * decoded to UTF-8 for any headers that are recognized by Camel.
 * See also camel_medium_dup_headers().
 *
 * @return the array of headers, owned by @medium.
 */
- (const CamelNameValueArray*)headers;

/**
 * Removes the named header from the medium.  All occurances of the
 * header are removed.
 *
 * @param name the name of the header
 */
- (void)removeHeaderWithName:(OFString*)name;

/**
 * Sets the content of @medium to be @content.
 *
 * @param content a #CamelDataWrapper object
 */
- (void)setContent:(OGCamelDataWrapper*)content;

/**
 * Sets the value of a header.  Any other occurances of the header
 * will be removed.  Setting a %NULL header can be used to remove
 * the header also.
 *
 * @param name name of the header
 * @param value value of the header
 */
- (void)setHeaderWithName:(OFString*)name value:(OFString*)value;

@end