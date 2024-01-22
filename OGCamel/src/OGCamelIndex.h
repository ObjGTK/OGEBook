/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelIndexCursor;
@class OGCamelIndexName;

@interface OGCamelIndex : OGObject
{

}


/**
 * Methods
 */

- (CamelIndex*)castedGObject;

/**
 *
 * @param name a name to add
 * @return a #CamelIndexName with
 *    added given @name, or %NULL, when the @name could not be
 *    added.
 */
- (OGCamelIndexName*)addName:(OFString*)name;

/**
 *
 * @return
 */
- (gint)compress;

/**
 *
 * @param path
 * @param flags
 */
- (void)constructWithPath:(OFString*)path flags:(gint)flags;

/**
 *
 * @return
 */
- (gint)delete;

/**
 * Deletes the given @name from @index.
 *
 * @param name a name to delete
 */
- (void)deleteName:(OFString*)name;

/**
 *
 * @param word a word to find
 * @return a #CamelIndexCursor object with
 *    the given @word, or %NULL, when not found
 */
- (OGCamelIndexCursor*)find:(OFString*)word;

/**
 *
 * @param name a name to find
 * @return a #CamelIndexCursor with
 *    the given @name, or %NULL< when not found.
 */
- (OGCamelIndexCursor*)findName:(OFString*)name;

/**
 *
 * @param name
 * @return
 */
- (gint)hasName:(OFString*)name;

/**
 *
 * @param path
 * @return
 */
- (gint)rename:(OFString*)path;

/**
 *
 * @param func normalization function
 * @param userData user data for @func
 */
- (void)setNormalizeWithFunc:(CamelIndexNorm)func userData:(gpointer)userData;

/**
 *
 * @return
 */
- (gint)sync;

/**
 *
 * @return a #CamelIndexCursor containing
 *    all words of the @index, or %NULL, when there are none
 */
- (OGCamelIndexCursor*)words;

/**
 *
 * @param idn
 * @return
 */
- (gint)writeName:(OGCamelIndexName*)idn;

@end