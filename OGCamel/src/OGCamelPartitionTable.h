/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <camel/camel.h>

#import <OGObject/OGObject.h>

@class OGCamelBlockFile;

@interface OGCamelPartitionTable : OGObject
{

}


/**
 * Constructors
 */
+ (instancetype)partitionTableWithBs:(OGCamelBlockFile*)bs root:(camel_block_t)root;

/**
 * Methods
 */

- (CamelPartitionTable*)castedGObject;

/**
 *
 * @param key
 * @param keyid
 * @return
 */
- (gint)addWithKey:(OFString*)key keyid:(camel_key_t)keyid;

/**
 *
 * @param key
 * @return
 */
- (camel_key_t)lookupWithKey:(OFString*)key;

/**
 *
 * @param key
 * @return
 */
- (bool)removeWithKey:(OFString*)key;

/**
 *
 * @return
 */
- (gint)sync;

@end