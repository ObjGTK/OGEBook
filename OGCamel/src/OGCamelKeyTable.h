/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelBlockFile;

@interface OGCamelKeyTable : OGObject
{

}


/**
 * Constructors
 */
- (instancetype)initWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root;

/**
 * Methods
 */

- (CamelKeyTable*)castedGObject;

/**
 *
 * @param key
 * @param data
 * @param flags
 * @return
 */
- (camel_key_t)addWithKey:(OFString*)key data:(camel_block_t)data flags:(guint)flags;

/**
 *
 * @param keyid
 * @param key
 * @param flags
 * @return
 */
- (camel_block_t)lookupWithKeyid:(camel_key_t)keyid key:(gchar**)key flags:(guint*)flags;

/**
 *
 * @param next
 * @param keyp
 * @param flagsp
 * @param datap
 * @return
 */
- (camel_key_t)nextWithNext:(camel_key_t)next keyp:(gchar**)keyp flagsp:(guint*)flagsp datap:(camel_block_t*)datap;

/**
 *
 * @param keyid
 * @param data
 * @return
 */
- (bool)setDataWithKeyid:(camel_key_t)keyid data:(camel_block_t)data;

/**
 *
 * @param keyid
 * @param flags
 * @param set
 * @return
 */
- (bool)setFlagsWithKeyid:(camel_key_t)keyid flags:(guint)flags set:(guint)set;

/**
 *
 * @return
 */
- (gint)sync;

@end