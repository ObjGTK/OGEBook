/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@interface OGCamelHTMLParser : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)hTMLParser;

/**
 * Methods
 */

- (CamelHTMLParser*)castedGObject;

/**
 *
 * @param name
 * @return
 */
- (OFString*)attrWithName:(OFString*)name;

/**
 * Provides parsed array of values and attributes. Both arrays are
 * owned by the @hp.
 *
 * @param values an output #GPtrArray with values, or %NULL
 * @return a #GPtrArray of parsed attributes
 */
- (const GPtrArray*)attrListWithValues:(const GPtrArray**)values;

/**
 *
 * @param lenp
 * @return
 */
- (OFString*)leftWithLenp:(gint*)lenp;

/**
 *
 * @param start
 * @param len
 * @param last
 */
- (void)setDataWithStart:(OFString*)start len:(gint)len last:(gint)last;

/**
 *
 * @param datap
 * @param lenp
 * @return
 */
- (CamelHTMLParserState)stepWithDatap:(const gchar**)datap lenp:(gint*)lenp;

/**
 *
 * @return
 */
- (OFString*)tag;

@end